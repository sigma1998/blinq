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
import 'package:blinq/utils/smart_widgets/dialogs/blinq_activated/blinq_activated_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/rename_device/rename_device_dialog.dart';

part 'connect_to_blinq_cubit.freezed.dart';

part 'connect_to_blinq_state.dart';

class ConnectToBlinqCubit extends Cubit<ConnectToBlinqState> {
  //
  final PermissionService permissionService;

  //akhror added
  BluetoothCharacteristic? resetCharacteristic;

  ConnectToBlinqCubit({required this.permissionService})
      : super(ConnectToBlinqState());

  final BluetoothHelper _bluetoothHelper = BluetoothHelper();

  final flutterReactiveBle = FlutterReactiveBle();
  late QualifiedCharacteristic _readCharacteristic;
  late QualifiedCharacteristic _writeCharacteristic;
  late Stream<List<int>> _receivedDataStream;
  late Stream<ConnectionStateUpdate> _currentConnectionStream;
  late StreamSubscription<ConnectionStateUpdate> _connection;

  StreamSubscription<DiscoveredDevice>? _scanStream;

  setInitialState() {
    emit(state.copyWith(
      boardConnectionState: DeviceConnectionState.disconnected,
      scanning: true,
      scannedBleDevices: [],
      savedBleDevices: [],
    ));
    restartScanning();
  }

  void onNavigateBack() =>
      NavigationService.homeNavigatorKey.currentState?.pop();

  Future<void> onRenameDevice(DiscoveredDevice device) async {
    await NavigationService.showDialog(
      dialog: RenameDeviceDialog(
        device: device,
      ),
    );
  }

  Future<void> findPreviouslyPairedDevices() async {
    print('CAME HERE____________________________findPreviouslyPairedDevices');
    final savedBleDevices = await LocalStorageService().getDevices;

    /// saving all available devices from local db to our state
    emit(state.copyWith(savedBleDevices: List.of(savedBleDevices)));
  }

  Future<void> connectPreviousDevices() async {
    print('CAME HERE____________________________connectPreviousDevices');

    /// Clearing board before connection
    await findPreviouslyPairedDevices();

    /// If no saved devices are discovered, this function should stop moving forward
    if (state.savedBleDevices.isEmpty &&
        state.boardConnectionState != DeviceConnectionState.disconnected) {
      return;
    }

    if (Platform.isAndroid) {
      bool isAndroidPermissions = await checkPermissions();
      if (isAndroidPermissions) _initializeScanningStream();
    } else {
      _initializeScanningStream();
    }
  }

  void _initializeScanningStream() async {
    print('CAME HERE____________________________initializeScanningStream');
    await _bluetoothHelper.checkBleConnectionStatus();

    emit(state.copyWith(scanning: true));
    if (_scanStream != null) {
      await _scanStream!.cancel();
      _scanStream = null;
    }

    _scanStream = flutterReactiveBle.scanForDevices(
        scanMode: ScanMode.lowPower, withServices: [uuidService]).listen(
      _onDeviceFound,
      onError: (e) {
        emit(state.copyWith(scanning: false));
      },
    );
  }

  void _onDeviceFound(DiscoveredDevice device) async {
    print('CAME HERE___________________________onDeviceFound');
    List<DiscoveredDevice> previouslyScannedDevices = [
      ...state.scannedBleDevices
    ];

    Iterable<DiscoveredDevice> isDeviceAlreadyScanned =
        previouslyScannedDevices.where((element) => element.id == device.id);

    if (isDeviceAlreadyScanned.isEmpty == true) {
      previouslyScannedDevices.add(device);
      emit(state.copyWith(scannedBleDevices: [...previouslyScannedDevices]));
    }

    await stopScanning();
    await Future.delayed(const Duration(seconds: 1));
    debugPrint("BEFORE CONNECTING TO DISCOVERED DEVICE");
    _connectToDetectedDevice(device);
  }

  Future<void> stopScanning() async {
    if (_scanStream == null) return;

    await _scanStream!.cancel();
    _scanStream = null;
    emit(state.copyWith(scanning: false));
  }

  void restartScanning() {
    debugPrint("START OF RESTARRT SCANNING");
    if (_scanStream == null) {
      debugPrint("SCANNING IS INITIALIZED");
      _initializeScanningStream();
      return;
    }

    debugPrint('recentlyConnected: ${state.recentlyConnected}');
    debugPrint("SCANNING IS RESUMED");
    _scanStream!.resume();
    emit(state.copyWith(scanning: true));
  }

  void removeDeviceFromScannedList(DiscoveredDevice device) {
    print('CAME HERE__________________________removeDeviceFromScannedList');
    debugPrint("THIS IS BEING CALLED");
    List<DiscoveredDevice> scannedDevices = [...state.scannedBleDevices];
    scannedDevices.removeWhere((element) => element.id == device.id);
    debugPrint('Scanned Devices: $scannedDevices');
    emit(state.copyWith(scannedBleDevices: [...scannedDevices]));
    restartScanning();
  }

  void _connectToDetectedDevice(DiscoveredDevice device) async {
    //await _bluetoothHelper.clearPairedDevicesOnGadget(device);
    print('CAME HERE__________________________connectToDetectedDevice');
    await findPreviouslyPairedDevices();

    if (state.savedBleDevices.isEmpty) return;

    final pairedDevices =
        state.savedBleDevices.where((element) => element.id == device.id);

    if (pairedDevices.isNotEmpty) {
      await onConnectDevice(device);
    }

    if (state.boardConnectionState == DeviceConnectionState.disconnected) {
      restartScanning();
    }
  }

  Future<void> unpairBoardFunctionality() async {
    print('CAME HERE__________________________unpairBoardFunctionality');
    List<int> unPairData = _bluetoothHelper.bleUnpair();
    await sendData(unPairData);
  }

  void _handleSuccessfulPairing(DiscoveredDevice device) async {
    print('CAME HERE__________________________handleSuccessfulPairing');
    emit(state.copyWith(recentlyConnected: device));

    await LocalStorageService().saveDevice(device);

    NavigationService.showDialog(
      dialog: const BlinqActivatedDialog(),
    );
  }

  Future<void> onConnectDevice(DiscoveredDevice device) async {
    print('CAME HERE__________________________onConnectDevice');
    emit(state.copyWith(
      pairedState: kNa,
      stateTexts: "Paired: N/A",
      receivedData: [],
    ));

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
            emit(
                state.copyWith(bleConnectionState: BleConnectionState.pairing));
            break;

          case DeviceConnectionState.connected:
            emit(
                state.copyWith(bleConnectionState: BleConnectionState.pairing));
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
            await sendData(bleQueryData);
            break;

          case DeviceConnectionState.disconnecting:
            emit(state.copyWith(
                bleConnectionState: BleConnectionState.disconnected));
            break;

          case DeviceConnectionState.disconnected:
            emit(state.copyWith(
                bleConnectionState: BleConnectionState.disconnected));
            removeDeviceFromScannedList(device);

            break;
        }
      },
    );

    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> bleClearPaired(DiscoveredDevice device) async {
    List<int> value = List<int>.filled(18, 0x5A);
    await sendData(value);
  }

  void onReceiveBLEData(List<int> data, DiscoveredDevice device) async {
    print('CAME HERE__________________________onReceiveBLEData');
    debugPrint('====> Receiving BLE Data');
    int cmd = data[0];
    debugPrint("IN RECEIVE DATA: $data");
    debugPrint('cmd == bleCmdPairState: ${cmd == bleCmdPairState}');

    if (cmd == bleCmdMsg) {
      int len = data.length - 1;
      if (len > 0) {
        debugPrint("msg:$data.length");
        List<int> msgAckData = _bluetoothHelper.bleMsgAck(data);
        await sendData(msgAckData);
      }
    } else if (cmd == bleCmdPairState && data.length >= 2) {
      int localState = data[1];
      if (localState == 0x00) {
        debugPrint('Paired: Yes');
        emit(state.copyWith(
          pairedState: kPaired,
          stateTexts: "Paired: Yes",
          bleConnectionState: BleConnectionState.paired,
        ));

        _handleSuccessfulPairing(device);
      } else if (localState == 0x01) {
        /// This triggers pairing mechanism.
        List<int> doPairData = await _bluetoothHelper.bleDoPair();
        await sendData(doPairData);
        debugPrint('Paired: No: In Triggers pairing mechanism');
        emit(state.copyWith(
          pairedState: kUnpaired,
          stateTexts: "Paired: No",
          bleConnectionState: BleConnectionState.pairing,
        ));
      } else {
        if (localState == 0x02) {
          debugPrint('Paired: Full');
          emit(state.copyWith(
            pairedState: kFull,
            stateTexts: "Paired: Full",
            bleConnectionState: BleConnectionState.full,
          ));
          NavigationService.showErrorToast(
              'The device is already paired to 2 other devices.');
        } else {
          debugPrint('Paired: N/A');
          emit(state.copyWith(
            pairedState: kNa,
            stateTexts: "Paired: N/A",
            bleConnectionState: BleConnectionState.error,
          ));
        }
      }
    } else if (cmd == bleCmdPairStart && data.length >= 20) {
      debugPrint('Length greater than 20');
      List<int> blePairAckData = _bluetoothHelper.blePairAck(data);
      await sendData(blePairAckData);
      // blePairAck(bleData, state.mDeviceAddress);
    } else if (cmd == bleCmdPairAck && data.length >= 2) {
      int localState = data[1];
      if (localState == 0x00) {
        debugPrint("Pair succ!");
        emit(state.copyWith(
          pairedState: kPaired,
          stateTexts: "Paired: Yes",
          bleConnectionState: BleConnectionState.paired,
        ));
        _handleSuccessfulPairing(device);
      } else {
        debugPrint("Pair fail!");
        emit(state.copyWith(
          pairedState: kUnpaired,
          stateTexts: "Paired: No",
          bleConnectionState: BleConnectionState.unpaired,
        ));
      }
    } else if (cmd == bleCmdUnpair) {
      debugPrint('AT BLE CMD unpair');

      List<int> bleUnpairAckData = _bluetoothHelper.bleUnpairAck(data);
      await sendData(bleUnpairAckData);
      // bleUnpairAck(bleData, state.mDeviceAddress);
    } else if (cmd == bleCmdUnpairAck && data.length >= 2) {
      int localState = data[1];
      if (localState == 0x00) {
        debugPrint("Unpair success!");
        debugPrint('At Un pair');
        await LocalStorageService().removeSavedDevice(device);
        await findPreviouslyPairedDevices();
        disconnect(true);
      }
    }
  }

  Future<void> sendData(List<int> data) async {
    print('CAME HERE__________________________sendData');
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
    print('CAME HERE__________________________onNewReceivedData________$data');
    debugPrint('====> On New Received Data');
    debugPrint("RESPONSE: $data");
    List<String> receivedDataLocal = [...state.receivedData];
    emit(state.copyWith(receivedData: receivedDataLocal));
    debugPrint('Received Data Result: $receivedDataLocal');
    if (state.receivedData.length > 10) {
      debugPrint('Receive data is greater than 10');
      List<String> receivedDataLocal = [...state.receivedData];
      receivedDataLocal.removeAt(0);
      emit(state.copyWith(receivedData: receivedDataLocal));
    }
    onReceiveBLEData(data, device);
  }

  void disconnect(bool isUnpairing) async {
    print('CAME HERE__________________________disconnect');
    debugPrint('====> Disconnect Called');
    await _connection.cancel();

    emit(state.copyWith(
      boardConnectionState: DeviceConnectionState.disconnected,
      bleConnectionState: BleConnectionState.disconnected,
      pairedState: kNa,
      stateTexts: "Paired: N/A",
      recentlyConnected: isUnpairing == true ? null : state.recentlyConnected,
    ));
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
