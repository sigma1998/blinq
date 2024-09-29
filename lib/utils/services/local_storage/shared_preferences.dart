// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:blinq/data/model/found_device/found_device_model.dart';

class LocalStorageService {
  //
  final String _deviceKey = 'DeviceId';

  Future<List<DiscoveredDevice>> get getDevices async {
    final prefs = await SharedPreferences.getInstance();

    List<String> previousDevices = prefs.getStringList(_deviceKey) ?? [];

    debugPrint('Previous Devices: $previousDevices');

    List<FoundDeviceModel> devices = previousDevices
        .map((e) => FoundDeviceModel.fromJson(jsonDecode(e)))
        .toList();
    if (devices.isNotEmpty) {
      debugPrint(devices[0].toJson().toString());
      List<DiscoveredDevice> discoveredDevices = [];

      for (var device in devices) {
        discoveredDevices.add(DiscoveredDevice(
          id: device.id,
          serviceData: device.serviceData,
          manufacturerData: device.manufacturerData,
          rssi: device.rssi,
          serviceUuids: device.serviceUuids,
          name: device.name,
        ));
      }
      return discoveredDevices;
    } else {
      return [];
    }
  }

  /// This function is use save the device ids
  Future<void> saveDevice(DiscoveredDevice device) async {
    debugPrint('Saving');
    final prefs = await SharedPreferences.getInstance();
    FoundDeviceModel deviceModel = FoundDeviceModel(
      id: device.id,
      name: device.name,
      serviceUuids: device.serviceUuids,
      rssi: device.rssi,
      manufacturerData: device.manufacturerData,
      serviceData: device.serviceData,
    );
    String deviceModelEncoded = jsonEncode(deviceModel.toJson());

    List<String> previousDevices = prefs.getStringList(_deviceKey) ?? [];

    debugPrint("Save devices: $previousDevices");
    if (await isDeviceInList(device) == false) {
      previousDevices.add(deviceModelEncoded);
      debugPrint('Device $device saved!');
      await prefs.setStringList(_deviceKey, previousDevices);
    } else {
      debugPrint('Device already exist in db');
    }
    debugPrint("In db list of devices available is $getDevices");
  }

  Future<bool> isDeviceInList(DiscoveredDevice device) async {
    List<DiscoveredDevice> alreadySaveDevices = await getDevices;
    for (DiscoveredDevice existingDevice in alreadySaveDevices) {
      if (device.id == existingDevice.id) {
        return true;
      }
    }
    return false;
  }

  Future<DiscoveredDevice?> getDeviceById(String id) async {
    DiscoveredDevice? device;
    List<DiscoveredDevice> alreadySaveDevices = await getDevices;
    for (var element in alreadySaveDevices) {
      if(element.id == id){
        device = element;
      }
    }
    return device;
  }

  Future<void> renameSavedDevice(DiscoveredDevice device) async {
    // List<DiscoveredDevice> alreadySaveDevices = await getDevices;
    // int indexOfDevice =
    //     alreadySaveDevices.indexWhere((element) => element.id == device.id);
    // alreadySaveDevices.removeWhere((element) => element.id == device.id);

    FoundDeviceModel deviceModel = FoundDeviceModel(
      id: device.id,
      name: device.name,
      serviceUuids: device.serviceUuids,
      rssi: device.rssi,
      manufacturerData: device.manufacturerData,
      serviceData: device.serviceData,
    );
    String deviceModelEncoded = jsonEncode(deviceModel.toJson());

    final prefs = await SharedPreferences.getInstance();
    List<String> previousDevices = prefs.getStringList(_deviceKey) ?? [];
    previousDevices.removeWhere((element) =>
        FoundDeviceModel.fromJson(jsonDecode(element)).id == device.id);
    previousDevices.add(deviceModelEncoded);
    await prefs.setStringList(_deviceKey, previousDevices);

    debugPrint('===> Modified device is saved in local storage');
  }

  Future<void> removeSavedDevice(DiscoveredDevice device) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> previousDevices = prefs.getStringList(_deviceKey) ?? [];
    List<FoundDeviceModel> devices = previousDevices
        .map((e) => FoundDeviceModel.fromJson(jsonDecode(e)))
        .toList();

    if (devices.isEmpty == true) return;

    Iterable<FoundDeviceModel> foundDevices =
        devices.where((element) => element.id == device.id);

    if (foundDevices.isEmpty == true) return;

    devices.removeWhere((element) => element.id == device.id);

    List<String> savedDevicesEncoded =
        devices.map((e) => jsonEncode(e)).toList();

    await prefs.setStringList(_deviceKey, savedDevicesEncoded);

    debugPrint('===> Modified device is saved in local storage');
  }
}
