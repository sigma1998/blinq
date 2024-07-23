
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothManager {

  Future<void> connect() async {
    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth not supported by this device.......");
      return;
    }

    var subscription = FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
      } else {
        // show an error to the user, etc
      }
    });

    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }
  }

}
