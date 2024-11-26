import 'dart:async';
import 'dart:io';

import 'package:blinq/presentation/connect_to_blinq/cubit/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:location/location.dart';
import 'package:sprintf/sprintf.dart';

import '../../../presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import '../../../utils/bluetooth_helper.dart';
import '../../../utils/services/local_storage/shared_preferences.dart';
import '../../../utils/services/location/location_service.dart';
import '../../../utils/services/permission/permission_service.dart';

class BluetoothBackgroundService {
  ///
  final PermissionService permissionService;
  final BluetoothHelper _bluetoothHelper = BluetoothHelper();
  final flutterReactiveBle = FlutterReactiveBle();
  late QualifiedCharacteristic _readCharacteristic;
  late QualifiedCharacteristic _writeCharacteristic;
  late Stream<List<int>> _receivedDataStream;
  late Stream<ConnectionStateUpdate> _currentConnectionStream;
  late StreamSubscription<ConnectionStateUpdate> _connection;
  StreamSubscription<DiscoveredDevice>? _scanStream;

  ///
  Function? _emitter;

  ///
  bool connecting = false;
  Timer? connectionCounter;

  ///states
  DeviceConnectionState boardConnectionState =
      DeviceConnectionState.disconnected;
  BleConnectionState bleConnectionState = BleConnectionState.disconnected;
  List<DiscoveredDevice> scannedBleDevices = [];
  List<DiscoveredDevice> savedBleDevices = [];
  int pairedState = kNa;
  bool scanning = false;
  String stateTexts = 'N/A';
  List<String> receivedData = [];
  int connectAttempt = 0;
  DiscoveredDevice? recentlyConnected;

  BluetoothBackgroundService(
    this.permissionService,
  );

  setScan(Function? emitter) {
    _emitter = emitter;
  }

  emit({
    DeviceConnectionState? boardConnectionState,
    BleConnectionState? bleConnectionState,
    List<DiscoveredDevice>? scannedBleDevices,
    List<DiscoveredDevice>? savedBleDevices,
    int? pairedState,
    bool? scanning,
    String? stateTexts,
    List<String>? receivedData,
    int? connectAttempt,
    DiscoveredDevice? recentlyConnected,
  }) async {
    _emitter?.call(
      boardConnectionState ?? this.boardConnectionState,
      bleConnectionState ?? this.bleConnectionState,
      scannedBleDevices ?? this.scannedBleDevices,
      savedBleDevices ?? this.savedBleDevices,
      pairedState ?? this.pairedState,
      scanning ?? this.scanning,
      stateTexts ?? this.stateTexts,
      receivedData ?? this.receivedData,
      connectAttempt ?? this.connectAttempt,
      recentlyConnected ?? this.recentlyConnected,
    );
  }

  setTimer() {
    connecting = true;
    connectionCounter = Timer(const Duration(seconds: 1), () {
      connecting = false;
    });
  }

  setInitialState() {
    emit(
      boardConnectionState: DeviceConnectionState.disconnected,
      scanning: true,
      scannedBleDevices: [],
      savedBleDevices: [],
    );
    restartScanning();
  }

  Future<void> renameCurrentDevice(DiscoveredDevice device) async {
    emit(recentlyConnected: device);
    await LocalStorageService().renameSavedDevice(device);
    findPreviouslyPairedDevices();
  }

  Future<void> renameDevice(DiscoveredDevice device) async {
    await LocalStorageService().renameSavedDevice(device);
    emit(savedBleDevices: []);
    findPreviouslyPairedDevices();
  }

  Future<void> findPreviouslyPairedDevices() async {
    final savedBleDevices = await LocalStorageService().getDevices;

    /// saving all available devices from local db to our state
    emit(savedBleDevices: List.of(savedBleDevices));
  }

  Future<void> connectPreviousDevices() async {
    print('connectPreviousDevices__________________');

    /// Clearing board before connection
    await findPreviouslyPairedDevices();

    /// If no saved devices are discovered, this function should stop moving forward
    if (savedBleDevices.isEmpty &&
        boardConnectionState != DeviceConnectionState.disconnected) {
      return;
    }

    if (Platform.isAndroid) {
      bool isAndroidPermissions = await checkPermissions();
      if (isAndroidPermissions) initializeScanningStream();
    } else {
      initializeScanningStream();
    }
  }

  Future<void> initializeScanningStream() async {
    print('_initializeScanningStream__________________');
    await _bluetoothHelper.checkBleConnectionStatus();

    emit(scanning: true);
    if (_scanStream != null) {
      await _scanStream!.cancel();
      _scanStream = null;
    }

    _scanStream = flutterReactiveBle.scanForDevices(
        scanMode: ScanMode.lowPower, withServices: [uuidService]).listen(
      onDeviceFound,
      onError: (e) {
        emit(scanning: false);
      },
    );
  }

  void onDeviceFound(DiscoveredDevice device) async {
    ///matching current found with saved items
    final LocalStorageService storage = LocalStorageService();
    DiscoveredDevice? edited = await storage.getDeviceById(device.id);
    edited ??= device;
    emit(recentlyConnected: edited);

    List<DiscoveredDevice> previouslyScannedDevices = [...scannedBleDevices];

    Iterable<DiscoveredDevice> isDeviceAlreadyScanned =
        previouslyScannedDevices.where((element) => element.id == edited!.id);

    if (isDeviceAlreadyScanned.isEmpty) {
      previouslyScannedDevices.add(edited);
      emit(scannedBleDevices: [...previouslyScannedDevices]);
    }

    await Future.delayed(const Duration(seconds: 1));
    if (!connecting &&
        boardConnectionState == DeviceConnectionState.disconnected) {
      connectToDetectedDevice(edited);
      setTimer();
    }
    // if (state.bleConnectionState != BleConnectionState.paired) {
    //   connectToDetectedDevice(edited);
    // }
  }

  Future<void> stopScanning() async {
    print('stopScanning__________________');
    if (_scanStream == null) return;
    await _scanStream!.cancel();
    _scanStream = null;
    emit(scanning: false);
  }

  Future<void> restartScanning() async {
    print('restartScanning__________________');
    emit(
      scanning: true,
      scannedBleDevices: [],
    );
    await Future.delayed(const Duration(seconds: 1));
    if (_scanStream == null) {
      initializeScanningStream();
      return;
    }
    _scanStream!.resume();
  }

  void removeDeviceFromScannedList(DiscoveredDevice device) {
    List<DiscoveredDevice> scannedDevices = [...scannedBleDevices];
    scannedDevices.removeWhere((element) => element.id == device.id);
    emit(scannedBleDevices: [...scannedDevices]);
    restartScanning();
  }

  void connectToDetectedDevice(DiscoveredDevice device) async {
    print('CONNECT TO BLINQ DEVICE__________________');
    await findPreviouslyPairedDevices();

    if (savedBleDevices.isEmpty) return;

    final pairedDevices =
        savedBleDevices.where((element) => element.id == device.id);

    print('ENTERED HERE ____________________${pairedDevices.isNotEmpty}');
    print('ENTERED HERE ____________________${recentlyConnected == null}');
    print('ENTERED HERE ____________________${bleConnectionState}');
    if (pairedDevices.isNotEmpty &&
        bleConnectionState != BleConnectionState.pairing) {
      //second and third, akhror added
      await onConnectDevice(device);
    }

    // if (state.boardConnectionState == DeviceConnectionState.disconnected) {
    //   restartScanning();
    // }
  }

  Future<void> unpairBoardFunctionality() async {
    List<int> unPairData = _bluetoothHelper.bleUnpair();
    await sendData(unPairData);
  }

  void handleSuccessfulPairing(DiscoveredDevice device) async {
    print('_handleSuccessfulPairing__________________');
    emit(recentlyConnected: device);

    await LocalStorageService().saveDevice(device);
    findPreviouslyPairedDevices();

    // NavigationService.showDialog(
    //   dialog: const BreakdownAccident(),
    // );

    // NavigationService.showDialog(
    //   dialog: const BlinqActivatedDialog(),
    // );
  }

  Future<void> onConnectDevice(DiscoveredDevice device) async {
    emit(
      pairedState: kNa,
      stateTexts: "Paired: N/A",
      receivedData: [],
    );

    // await Future.delayed(const Duration(seconds: 3));

    /// This sets the base device inside core ble utility
    /// which will serve us the pairing functionality.
    _bluetoothHelper.setDeviceAddress = device;

    _currentConnectionStream = flutterReactiveBle.connectToDevice(
      id: device.id,
      connectionTimeout: const Duration(seconds: 5),
    );

    debugPrint('just before listening');
    _connection = _currentConnectionStream.listen(
      (event) async {
        debugPrint(event.connectionState.name);
        emit(boardConnectionState: event.connectionState);
        switch (event.connectionState) {
          case DeviceConnectionState.connecting:
            print('CONNECTING_________________');
            emit(
              bleConnectionState: BleConnectionState.pairing,
              recentlyConnected: device,
            );
            break;

          case DeviceConnectionState.connected:
            print('CONNECTED_________________');
            emit(
              bleConnectionState: BleConnectionState.paired,
              recentlyConnected: device,
            );
            _readCharacteristic =
                _bluetoothHelper.getReadCharacteristic(event.deviceId);

            _receivedDataStream = flutterReactiveBle
                .subscribeToCharacteristic(_readCharacteristic);
            _receivedDataStream.listen(
              (data) {
                onNewReceivedData(data, device);
              },
              onError: (dynamic error) {},
            );
            _writeCharacteristic =
                _bluetoothHelper.getWriteCharacteristic(event.deviceId);

            final bleQueryData = await _bluetoothHelper.bleQueryPairState();
            // await stopScanning(); //akhror  added
            await sendData(bleQueryData);
            break;

          case DeviceConnectionState.disconnecting:
            print('Dis CONNECTING_________________');
            emit(
              bleConnectionState: BleConnectionState.disconnected,
              recentlyConnected: null,
              scannedBleDevices: [],
            );
            break;

          case DeviceConnectionState.disconnected:
            print('DISCONNECTED_________________');
            emit(
              bleConnectionState: BleConnectionState.disconnected,
              recentlyConnected: null,
              scannedBleDevices: [],
            );
            restartScanning(); //akhror added
            removeDeviceFromScannedList(device);

            break;
        }
      },
    );
  }

  Future<void> bleClearPaired(DiscoveredDevice device) async {
    List<int> value = List<int>.filled(18, 0x5A);
    await sendData(value);
  }

  void onReceiveBLEData(List<int> data, DiscoveredDevice device) async {
    print('ON RECEIVE BLE DATA_________________');
    int cmd = data[0];

    if (cmd == bleCmdMsg) {
      int len = data.length - 1;
      if (len > 0) {
        List<int> msgAckData = _bluetoothHelper.bleMsgAck(data);
        await sendData(msgAckData);
        print('ON Sending new data_________________');
      }
    } else if (cmd == bleCmdPairState && data.length >= 2) {
      int localState = data[1];
      if (localState == 0x00) {
        emit(
          pairedState: kPaired,
          stateTexts: "Paired: Yes",
          bleConnectionState: BleConnectionState.paired,
        );
        print('onReceiveBLEData___________________PAIRed');
        handleSuccessfulPairing(device);
      } else if (localState == 0x01) {
        /// This triggers pairing mechanism.
        List<int> doPairData = await _bluetoothHelper.bleDoPair();
        await sendData(doPairData);
        print('onReceiveBLEData___________________PAIRING');
        emit(
          pairedState: kUnpaired,
          stateTexts: "Paired: No",
          bleConnectionState: BleConnectionState.pairing,
        );
      } else {
        if (localState == 0x02) {
          // debugPrint('Paired: Full');
          // emit(state.copyWith(
          //   pairedState: kFull,
          //   stateTexts: "Paired: Full",
          //   bleConnectionState: BleConnectionState.full,
          // ));
          // NavigationService.showErrorToast(
          //     'The device is already paired to 2 other devices.');
          await bleClearPaired(device);
          print('onReceiveBLEData___________________CLEARED');
          onConnectDevice(device);
        } else {
          print('Paired: N/A');
          emit(
            pairedState: kNa,
            stateTexts: "Paired: N/A",
            bleConnectionState: BleConnectionState.error,
          );
          print('onReceiveBLEData___________________ERROR');
        }
      }
    } else if (cmd == bleCmdPairStart && data.length >= 20) {
      print('Length greater than 20_________________');
      List<int> blePairAckData = _bluetoothHelper.blePairAck(data);
      await sendData(blePairAckData);
      // blePairAck(bleData, state.mDeviceAddress);
    } else if (cmd == bleCmdPairAck && data.length >= 2) {
      int localState = data[1];
      if (localState == 0x00) {
        print("Pair succ!__________________");
        emit(
          pairedState: kPaired,
          stateTexts: "Paired: Yes",
          bleConnectionState: BleConnectionState.paired,
        );
        handleSuccessfulPairing(device);
      } else {
        print("Pair fail!____________________");
        emit(
          pairedState: kUnpaired,
          stateTexts: "Paired: No",
          bleConnectionState: BleConnectionState.unpaired,
        );
      }
    } else if (cmd == bleCmdUnpair) {
      print('AT BLE CMD unpair___________________');

      List<int> bleUnpairAckData = _bluetoothHelper.bleUnpairAck(data);
      await sendData(bleUnpairAckData);
      // bleUnpairAck(bleData, state.mDeviceAddress);
    } else if (cmd == bleCmdUnpairAck && data.length >= 2) {
      int localState = data[1];
      if (localState == 0x00) {
        print("Unpair success!_____________________");
        print('At Un pair');
        await LocalStorageService().removeSavedDevice(device);
        await findPreviouslyPairedDevices();
        disconnect(true);
      }
    }
  }

  Future<void> sendData(List<int> data) async {
    debugPrint('====> Sending Data');
    String rev = "";
    for (int i = 0; i < data.length; i++) {
      rev += sprintf("%02x ", [data[i]]);
    }
    List<String> receivedData = [...(this.receivedData)];
    receivedData.add("APP: $rev");
    emit(
      receivedData: receivedData,
    );
    if (receivedData.length > 8) {
      List<String> receivedData = [...(this.receivedData)];
      receivedData.removeAt(0);
      emit(
        receivedData: receivedData,
      );
    }
    debugPrint("APP: $rev");
    await flutterReactiveBle.writeCharacteristicWithoutResponse(
      _writeCharacteristic,
      value: data,
    );
  }

  void onNewReceivedData(List<int> data, DiscoveredDevice device) {
    print('On New Received Data_________________________');
    print("RESPONSE_______onNewReceivedData_________________________: $data");
    List<String> receivedDataLocal = [...receivedData];
    emit(receivedData: receivedDataLocal);
    print('Received Data Result: $receivedDataLocal');
    if (receivedData.length > 10) {
      print('Receive data is greater than 10');
      List<String> receivedDataLocal = [...receivedData];
      receivedDataLocal.removeAt(0);
      emit(
        receivedData: receivedDataLocal,
      );
    }
    onReceiveBLEData(data, device);
  }

  Future<void> disconnect(bool isUnpairing) async {
    print('DISCONNECT___________________________');
    await _connection.cancel();

    emit(
      boardConnectionState: DeviceConnectionState.disconnected,
      bleConnectionState: BleConnectionState.disconnected,
      pairedState: kNa,
      stateTexts: "Paired: N/A",
      recentlyConnected: isUnpairing ? null : recentlyConnected,
    );
    restartScanning();
  }

  Future<bool> checkPermissions() async {
    await LocationService.requestPermission();
    await LocationService.requestService();
    final location =
        LocationService.locationPermission == PermissionStatus.granted;

    final bleScan = await permissionService.handleBluetoothScanPermission();
    final bleConnect =
        await permissionService.handleBluetoothConnectPermission();

    if (location && bleScan && bleConnect) {
      return true;
    } else {
      return false;
    }
  }
}
