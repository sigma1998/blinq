import 'dart:async';
import 'dart:ui';

import 'package:blinq/app/locator.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'bluetooth_service.dart';

const notificationChannelId = 'my_foreground';
const notificationId = 888;

Future<void> initializeService() async {
  DartPluginRegistrant.ensureInitialized();

  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: false,
        autoStartOnBoot: true,
        notificationChannelId: notificationChannelId,
        initialNotificationTitle: 'Bluetooth',
        initialNotificationContent: 'Searching for new device',
        foregroundServiceNotificationId: notificationId,
        foregroundServiceTypes: [
          AndroidForegroundType.connectedDevice,
          AndroidForegroundType.dataSync,
        ]),
    iosConfiguration: IosConfiguration(
      onBackground: (ServiceInstance service) async {
        if (service is IOSServiceInstance) {}
        return true;
      },
    ),
  );
}

onStart(ServiceInstance service) async {
  if (service is AndroidServiceInstance) {
    final bool isForeGround = await service.isForegroundService();
    if (!isForeGround) {
      getIt.get<BluetoothBackgroundService>().setInitialState();
    }
  }
}
