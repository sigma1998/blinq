import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

FoundDeviceModel foundDeviceModelFromJson(String str) =>
    FoundDeviceModel.fromJson(json.decode(str));

String foundDeviceModelToJson(FoundDeviceModel data) =>
    json.encode(data.toJson());

class FoundDeviceModel {
  String id;
  String name;
  Map<Uuid, Uint8List> serviceData;
  List<Uuid> serviceUuids;
  Uint8List manufacturerData;
  int rssi;

  FoundDeviceModel({
    required this.id,
    required this.name,
    required this.serviceData,
    required this.manufacturerData,
    required this.rssi,
    required this.serviceUuids,
  });

  factory FoundDeviceModel.fromJson(Map<String, dynamic> json) =>
      FoundDeviceModel(
        id: json["id"],
        name: json["name"],
        serviceData: {},
        manufacturerData: Uint8List.fromList([]),
        rssi: json["rssi"],
        serviceUuids: [],
      );

  static DiscoveredDevice get discoverableInitial {
    return DiscoveredDevice(
      id: '',
      name: '',
      serviceData: {},
      manufacturerData: Uint8List.fromList([]),
      rssi: 0,
      serviceUuids: [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "serviceData": serviceData.map((key, value) =>
            MapEntry({'uuid': key.toString()}, {'data': value.toList()})),
        "manufacturerData": manufacturerData,
        "rssi": rssi,
        "serviceUuids": serviceUuids.map((uuid) => uuid.toString()).toList(),
      };
}
