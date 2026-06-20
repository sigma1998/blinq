// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';
import 'package:sprintf/sprintf.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/cubit/constants.dart';
import 'package:blinq/utils/bluetooth_helper.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/local_storage/shared_preferences.dart';
import 'package:blinq/utils/services/location/location_service.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/rename_device/rename_device_dialog.dart';

import '../../../core/services/background_bluetooth_service/bluetooth_service.dart';
import '../../../utils/components/dialogs/modal/breakdown_accident.dart';
import '../../../utils/services/dialogs/bottom_sheet.dart';

part 'connect_to_blinq_cubit.freezed.dart';

part 'connect_to_blinq_state.dart';

class ConnectToBlinqCubit extends Cubit<ConnectToBlinqState> {
  //
  final PermissionService permissionService;

  //akhror added
  bool connecting = false;
  Timer? connectionCounter;

  //BluetoothBackgroundService bluetoothBackgroundService;

  ConnectToBlinqCubit({
    required this.permissionService,
  }) : super(ConnectToBlinqState());

  final BluetoothHelper _bluetoothHelper = BluetoothHelper();

  final flutterReactiveBle = FlutterReactiveBle();
  late QualifiedCharacteristic _readCharacteristic;
  late QualifiedCharacteristic _writeCharacteristic;
  late Stream<List<int>> _receivedDataStream;
  late Stream<ConnectionStateUpdate> _currentConnectionStream;
  late StreamSubscription<ConnectionStateUpdate> _connection;

  //search
  StreamSubscription<DiscoveredDevice>? _scanStream;

  ///for background
  emitStates({
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
    emit(state.copyWith(
      boardConnectionState: boardConnectionState ?? state.boardConnectionState,
      bleConnectionState: bleConnectionState ?? state.bleConnectionState,
      scannedBleDevices: scannedBleDevices ?? state.scannedBleDevices,
      savedBleDevices: savedBleDevices ?? state.savedBleDevices,
      pairedState: pairedState ?? state.pairedState,
      scanning: scanning ?? state.scanning,
      stateTexts: stateTexts ?? state.stateTexts,
      receivedData: receivedData ?? state.receivedData,
      connectAttempt: connectAttempt ?? state.connectAttempt,
      recentlyConnected: recentlyConnected ?? state.recentlyConnected,
    ));
  }

  setTimer() {
    connecting = true;
    connectionCounter = Timer(const Duration(seconds: 1), () {
      connecting = false;
    });
  }

  setInitialState() {
    emit(state.copyWith(
      boardConnectionState: DeviceConnectionState.disconnected,
      scanning: true,
      scannedBleDevices: [],
      savedBleDevices: [],
    ));
    restartScanning();
  }

  void onNavigateBack() => NavigationService.homeNavigatorKey.currentState?.pop();

  Future<void> onRenameDevice(DiscoveredDevice device) async {
    await NavigationService.showDialog(
      dialog: RenameDeviceDialog(
        device: device,
      ),
    );
  }

  Future<void> renameCurrentDevice(DiscoveredDevice device) async {
    //await bluetoothBackgroundService.renameCurrentDevice(device);

    emit(state.copyWith(recentlyConnected: device));
    await LocalStorageService().renameSavedDevice(device);
    findPreviouslyPairedDevices();
  }

  Future<void> renameDevice(DiscoveredDevice device) async {
    // await bluetoothBackgroundService.renameDevice(device);

    await LocalStorageService().renameSavedDevice(device);
    emit(state.copyWith(savedBleDevices: []));
    findPreviouslyPairedDevices();
  }

  Future<void> findPreviouslyPairedDevices() async {
    //await bluetoothBackgroundService.findPreviouslyPairedDevices();

    final savedBleDevices = await LocalStorageService().getDevices;

    /// saving all available devices from local db to our state
    emit(state.copyWith(savedBleDevices: List.of(savedBleDevices)));
  }

  Future<void> connectPreviousDevices() async {
    //await bluetoothBackgroundService.connectPreviousDevices();

    /// Clearing board before connection
    await findPreviouslyPairedDevices();

    /// If no saved devices are discovered, this function should stop moving forward
    if (state.savedBleDevices.isEmpty && state.boardConnectionState != DeviceConnectionState.disconnected) {
      return;
    }

    if (Platform.isAndroid) {
      bool isAndroidPermissions = await checkPermissions();
      if (isAndroidPermissions) _initializeScanningStream();
    } else {
      _initializeScanningStream();
    }
  }

  Future<void> _initializeScanningStream() async {
    //await bluetoothBackgroundService.initializeScanningStream();

    await _bluetoothHelper.checkBleConnectionStatus();

    emit(state.copyWith(scanning: true));
    if (_scanStream != null) {
      await _scanStream!.cancel();
      _scanStream = null;
    }

    _scanStream = flutterReactiveBle.scanForDevices(scanMode: ScanMode.lowPower, withServices: [uuidService]).listen(
      _onDeviceFound,
      onError: (e) {
        emit(state.copyWith(scanning: false));
      },
    );
  }

  void _onDeviceFound(DiscoveredDevice device) async {
    //bluetoothBackgroundService.onDeviceFound(device);

    ///matching current found with saved items
    final LocalStorageService storage = LocalStorageService();
    DiscoveredDevice? edited = await storage.getDeviceById(device.id);
    edited ??= device;
    emit(state.copyWith(recentlyConnected: edited));

    List<DiscoveredDevice> previouslyScannedDevices = [...state.scannedBleDevices];

    Iterable<DiscoveredDevice> isDeviceAlreadyScanned = previouslyScannedDevices.where((element) => element.id == edited!.id);

    if (isDeviceAlreadyScanned.isEmpty) {
      previouslyScannedDevices.add(edited);
      emit(state.copyWith(scannedBleDevices: [...previouslyScannedDevices]));
    }

    await Future.delayed(const Duration(seconds: 1));
    if (!connecting && state.boardConnectionState == DeviceConnectionState.disconnected && state.scannedBleDevices.isNotEmpty) {
      connectToDetectedDevice(edited);
      setTimer();
    }
    // if (state.bleConnectionState != BleConnectionState.paired) {
    //   connectToDetectedDevice(edited);
    // }
  }

  Future<void> stopScanning() async {
    //await bluetoothBackgroundService.stopScanning();

    if (_scanStream == null) return;
    await _scanStream!.cancel();
    _scanStream = null;
    emit(state.copyWith(scanning: false));
  }

  Future<void> restartScanning() async {
    //await bluetoothBackgroundService.restartScanning();

    emit(
      state.copyWith(
        scanning: true,
        scannedBleDevices: [],
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    if (_scanStream == null) {
      _initializeScanningStream();
      return;
    }
    _scanStream!.resume();
  }

  void removeDeviceFromScannedList(DiscoveredDevice device) {
    //bluetoothBackgroundService.removeDeviceFromScannedList(device);

    List<DiscoveredDevice> scannedDevices = [...state.scannedBleDevices];
    scannedDevices.removeWhere((element) => element.id == device.id);
    emit(state.copyWith(scannedBleDevices: [...scannedDevices]));
    NavigationService.showToast(text: "Device ${device.name} is disconnected", title: 'Blinq disconnected');
    restartScanning();
  }

  void connectToDetectedDevice(DiscoveredDevice device) async {
    //bluetoothBackgroundService.connectToDetectedDevice(device);

    await findPreviouslyPairedDevices();

    if (state.savedBleDevices.isEmpty) return;

    final pairedDevices = state.savedBleDevices.where((element) => element.id == device.id);

    if (pairedDevices.isNotEmpty && state.bleConnectionState != BleConnectionState.pairing) {
      //second and third, akhror added
      await onConnectDevice(device);
    }

    // if (state.boardConnectionState == DeviceConnectionState.disconnected) {
    //   restartScanning();
    // }
  }

  Future<void> unpairBoardFunctionality() async {
    //await bluetoothBackgroundService.unpairBoardFunctionality();

    List<int> unPairData = _bluetoothHelper.bleUnpair();
    await sendData(unPairData);
  }

  void _handleSuccessfulPairing(DiscoveredDevice device) async {
    //bluetoothBackgroundService.handleSuccessfulPairing(device);

    emit(state.copyWith(recentlyConnected: device));

    await LocalStorageService().saveDevice(device);
    findPreviouslyPairedDevices();

    if (!isBreakdownAccidentDialogShown) {
      showCustomBottomSheet(context: NavigationService.navigatorKey.currentContext!, child: BreakdownAccident());
    }

    // NavigationService.showDialog(
    //   dialog: const BlinqActivatedDialog(),
    // );
  }

  Future<void> onConnectDevice(DiscoveredDevice device) async {
    //await bluetoothBackgroundService.onConnectDevice(device);

    emit(state.copyWith(
      pairedState: kNa,
      stateTexts: "Paired: N/A",
      receivedData: [],
    ));

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
        emit(state.copyWith(boardConnectionState: event.connectionState));
        switch (event.connectionState) {
          case DeviceConnectionState.connecting:
            print('CONNECTING_________________');
            emit(state.copyWith(
              bleConnectionState: BleConnectionState.pairing,
              recentlyConnected: device,
            ));
            break;

          case DeviceConnectionState.connected:
            print('CONNECTED_________________');
            emit(state.copyWith(
              bleConnectionState: BleConnectionState.paired,
              recentlyConnected: device,
            ));
            _readCharacteristic = _bluetoothHelper.getReadCharacteristic(event.deviceId);

            _receivedDataStream = flutterReactiveBle.subscribeToCharacteristic(_readCharacteristic);
            _receivedDataStream.listen(
              (data) {
                onNewReceivedData(data, device);
              },
              onError: (dynamic error) {},
            );
            _writeCharacteristic = _bluetoothHelper.getWriteCharacteristic(event.deviceId);

            final bleQueryData = await _bluetoothHelper.bleQueryPairState();
            // await stopScanning(); //akhror  added
            await sendData(bleQueryData);
            break;

          case DeviceConnectionState.disconnecting:
            print('Dis CONNECTING_________________');
            emit(
              state.copyWith(
                bleConnectionState: BleConnectionState.disconnected,
                recentlyConnected: null,
                scannedBleDevices: [],
              ),
            );
            break;

          case DeviceConnectionState.disconnected:
            print('DISCONNECTED_________________');
            emit(
              state.copyWith(
                bleConnectionState: BleConnectionState.disconnected,
                recentlyConnected: null,
                scannedBleDevices: [],
              ),
            );
            removeDeviceFromScannedList(device);

            break;
        }
      },
    );
  }

  Future<void> bleClearPaired(DiscoveredDevice device) async {
    //await bluetoothBackgroundService.bleClearPaired(device);

    List<int> value = List<int>.filled(18, 0x5A);
    await sendData(value);
  }

  void onReceiveBLEData(List<int> data, DiscoveredDevice device) async {
    //bluetoothBackgroundService.onReceiveBLEData(data, device);

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
        emit(state.copyWith(
          pairedState: kPaired,
          stateTexts: "Paired: Yes",
          bleConnectionState: BleConnectionState.paired,
        ));
        print('onReceiveBLEData___________________PAIRed');
        _handleSuccessfulPairing(device);
      } else if (localState == 0x01) {
        /// This triggers pairing mechanism.
        List<int> doPairData = await _bluetoothHelper.bleDoPair();
        await sendData(doPairData);
        print('onReceiveBLEData___________________PAIRING');
        emit(state.copyWith(
          pairedState: kUnpaired,
          stateTexts: "Paired: No",
          bleConnectionState: BleConnectionState.pairing,
        ));
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
          emit(state.copyWith(
            pairedState: kNa,
            stateTexts: "Paired: N/A",
            bleConnectionState: BleConnectionState.error,
          ));
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
        emit(state.copyWith(
          pairedState: kPaired,
          stateTexts: "Paired: Yes",
          bleConnectionState: BleConnectionState.paired,
        ));
        _handleSuccessfulPairing(device);
      } else {
        print("Pair fail!____________________");
        emit(state.copyWith(
          pairedState: kUnpaired,
          stateTexts: "Paired: No",
          bleConnectionState: BleConnectionState.unpaired,
        ));
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
    //await bluetoothBackgroundService.sendData(data);

    debugPrint('====> Sending Data');
    String rev = "";
    for (int i = 0; i < data.length; i++) {
      rev += sprintf("%02x ", [data[i]]);
    }
    List<String> receivedData = [...state.receivedData];
    receivedData.add("APP: $rev");
    emit(
      state.copyWith(receivedData: receivedData),
    );
    if (state.receivedData.length > 8) {
      List<String> receivedData = [...state.receivedData];
      receivedData.removeAt(0);
      emit(state.copyWith(receivedData: receivedData));
    }
    debugPrint("APP: $rev");
    await flutterReactiveBle.writeCharacteristicWithoutResponse(
      _writeCharacteristic,
      value: data,
    );
  }

  void onNewReceivedData(List<int> data, DiscoveredDevice device) {
    // bluetoothBackgroundService.onNewReceivedData(data, device);

    print('On New Received Data_________________________');
    print("RESPONSE_______onNewReceivedData_________________________: $data");
    List<String> receivedDataLocal = [...state.receivedData];
    emit(state.copyWith(receivedData: receivedDataLocal));
    print('Received Data Result: $receivedDataLocal');
    if (state.receivedData.length > 10) {
      print('Receive data is greater than 10');
      List<String> receivedDataLocal = [...state.receivedData];
      receivedDataLocal.removeAt(0);
      emit(state.copyWith(receivedData: receivedDataLocal));
    }
    onReceiveBLEData(data, device);
  }

  Future<void> disconnect(bool isUnpairing) async {
    // await bluetoothBackgroundService.disconnect(isUnpairing);

    print('DISCONNECT___________________________');
    await _connection.cancel();

    emit(state.copyWith(
      boardConnectionState: DeviceConnectionState.disconnected,
      bleConnectionState: BleConnectionState.disconnected,
      pairedState: kNa,
      stateTexts: "Paired: N/A",
      recentlyConnected: isUnpairing ? null : state.recentlyConnected,
    ));
    restartScanning();
  }

  Future<bool> checkPermissions() async {
    //return await bluetoothBackgroundService.checkPermissions();

    await LocationService.requestPermission();
    await LocationService.requestService();
    final location = LocationService.locationPermission == PermissionStatus.granted;

    final bleScan = await permissionService.handleBluetoothScanPermission();
    final bleConnect = await permissionService.handleBluetoothConnectPermission();

    if (location && bleScan && bleConnect) {
      return true;
    } else {
      return false;
    }
  }
}
