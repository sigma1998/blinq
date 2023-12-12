// Dart imports:
import 'dart:io' show Platform;

// Flutter imports:
import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Package imports:
import 'package:blinq/utils/smart_widgets/dialogs/permission_dialog/permission_dialog.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:blinq/utils/navigation_service.dart';

// Project imports:
import 'device_info_helper.dart';
import 'md5_helper.dart';

const int appCmdQueryPairState = 0x01;
const int appCmdDoPair = 0x00;
const int appCmdPairAck = 0x02;
const int appCmdUnpair = 0x10;
const int appCmdUnpairAck = 0x12;
const int appCmdMsgAck = 0x55;

const int bleCmdPairState = 0x81;
const int bleCmdPairStart = 0x80;
const int bleCmdPairAck = 0x82;
const int bleCmdUnpair = 0x90;
const int bleCmdUnpairAck = 0x92;
const int bleCmdMsg = 0xAA;

const String bleKey = "u3s3NLM4";

final uuidService = Uuid.parse("00008900-0000-1000-8000-00805f9b34fb");
final uuidWrite = Uuid.parse("00008901-0000-1000-8000-00805f9b34fb");
final uuidRead = Uuid.parse("00008902-0000-1000-8000-00805f9b34fb");

final uuidServiceShort = Uuid.parse("8900");
final uuidWriteShort = Uuid.parse("8901");
final uuidReadShort = Uuid.parse("8902");

class BluetoothHelper {
  //
  String _deviceAddress = '';

  set setDeviceAddress(DiscoveredDevice device) {
    if (Platform.isIOS) {
      if (device.name.length >= 17) {
        _deviceAddress = device.name.substring(device.name.length - 17);
      } else {
        _deviceAddress = device.name;
      }
    } else {
      _deviceAddress = device.id;
    }
  }

  QualifiedCharacteristic getReadCharacteristic(String deviceID) {
    if (Platform.isIOS) {
      return QualifiedCharacteristic(
        serviceId: uuidServiceShort,
        characteristicId: uuidReadShort,
        deviceId: deviceID,
      );
    } else {
      return QualifiedCharacteristic(
        serviceId: uuidService,
        characteristicId: uuidRead,
        deviceId: deviceID,
      );
    }
  }

  QualifiedCharacteristic getWriteCharacteristic(String deviceID) {
    if (Platform.isIOS) {
      return QualifiedCharacteristic(
        serviceId: uuidServiceShort,
        characteristicId: uuidWriteShort,
        deviceId: deviceID,
      );
    } else {
      return QualifiedCharacteristic(
        serviceId: uuidService,
        characteristicId: uuidWrite,
        deviceId: deviceID,
      );
    }
  }

  void listCopy(
      List<int> src, int srcStart, List<int> des, int destStart, int len) {
    for (int i = 0; i < len; i++) {
      if ((i + srcStart) >= src.length || (i + destStart) >= des.length) {
        return;
      }
      des[i + destStart] = src[i + srcStart];
    }
  }

  Future<List<int>> bleQueryPairState() async {
    String uuid = await DeviceInfoHelper.getAppId();
    List<int> uuidBytes = uuid.codeUnits;
    List<int> value = List<int>.filled(16 + 1, 0);
    value[0] = appCmdQueryPairState;
    listCopy(uuidBytes, 0, value, 1, 16);
    return value;
  }

  Future<List<int>> bleDoPair() async {
    String ran = Md5Helper.getRandomMD5_4();
    List<int> ranByte = ran.codeUnits;
    List<int> value = List<int>.filled(4 + 1, 0);
    value[0] = appCmdDoPair;
    listCopy(ranByte, 0, value, 1, 4);
    return value;
  }

  List<int> blePairAck(List<int> data) {
    List<int> para = List<int>.filled(4, 0);
    listCopy(data, 1, para, 0, 4);
    String bleData = String.fromCharCodes(para);
    debugPrint("Ble Data:+$bleData");
    return _blePairAck(bleData);
  }

  List<int> _blePairAck(String bleData) {
    debugPrint('At BLE pair Ack');
    String s = bleData + bleKey + _deviceAddress;
    List<int> md5Byte = Md5Helper.getMD5Bytes(s);
    List<int> value = List<int>.filled(16 + 1 + 1, 0);
    value[0] = appCmdPairAck;
    value[1] = 0;
    listCopy(md5Byte, 0, value, 2, 16);
    return value;
  }

  List<int> bleUnpair() {
    String ran = Md5Helper.getRandomMD5_4();
    List<int> ranByte = ran.codeUnits;
    List<int> value = List<int>.filled(4 + 1, 0);
    value[0] = appCmdUnpair;
    listCopy(ranByte, 0, value, 1, 4);
    return value;
  }

  List<int> bleUnpairAck(List<int> data) {
    List<int> para = List<int>.filled(4, 0);
    listCopy(data, 1, para, 0, 4);
    String bleData = String.fromCharCodes(para);
    debugPrint("Ble Data:+$bleData");
    return _bleUnpairAck(bleData);
  }

  List<int> _bleUnpairAck(String bleData) {
    debugPrint('At BLE unpair ack');
    String s = bleData + bleKey + _deviceAddress;
    List<int> md5Byte = Md5Helper.getMD5Bytes(s);
    List<int> value = List<int>.filled(16 + 1 + 1, 0);
    value[0] = appCmdUnpairAck;
    value[1] = 0;
    listCopy(md5Byte, 0, value, 2, 16);
    return value;
  }

  List<int> bleClearPaired() {
    List<int> value = List<int>.filled(18, 0x5A);
    return value;
  }

  List<int> bleMsgAck(List<int> oriData) {
    debugPrint('In BLE Message ACk');
    List<int> value = List<int>.filled(oriData.length, 0);
    for (int i = 1; i < oriData.length; i++) {
      value[i] = (~oriData[i]) & 0xFF;
    }
    value[0] = appCmdMsgAck;
    return value;
  }

  Future<void> checkBleConnectionStatus() async {
    final isOn =
        await FlutterBluePlus.adapterState.first == BluetoothAdapterState.on;

    if (Platform.isAndroid && !isOn) {
      return await FlutterBluePlus.turnOn();
    } else if (Platform.isIOS && !isOn) {
      return await NavigationService.showDialog(
          dialog: PermissionDialog(
        onSettingsPressed: () async {
          await AppSettings.openAppSettings(
            asAnotherTask: true,
            type: AppSettingsType.bluetooth,
          );
        },
        title: 'strBleTurnOnPermission'.tr(),
      ));
    }
  }
}
