// Package imports:
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionService {
  Future requestCameraPermission();
  Future requestPhotosPermission();
  Future requestLocationPermission();
  Future requestNotificationPermission();
  Future requestSendSmsPermission();

  Future requrestBluetoothScanPermission();
  Future requrestBluetoothConnectPermission();

  //

  Future<bool> handleCameraPermission();
  Future<bool> handlePhotosPermission();
  Future<bool> handleLocationPermission();
  Future<bool> handleNotificationPermission();
  Future<bool> handleSendSmsPermission();

  Future<bool> handleBluetoothScanPermission();
  Future<bool> handleBluetoothConnectPermission();
}

class PermissionServiceImpl extends PermissionService {
  //
  @override
  Future<PermissionStatus> requestCameraPermission() async =>
      await Permission.camera.request();

  @override
  Future<PermissionStatus> requestPhotosPermission() async =>
      await Permission.photos.request();

  @override
  Future<PermissionStatus> requestLocationPermission() async =>
      await Permission.location.request();

  @override
  Future<PermissionStatus> requestNotificationPermission() async =>
      await Permission.notification.request();

  @override
  Future<PermissionStatus> requestSendSmsPermission() async =>
      await Permission.sms.request();

  @override
  Future<PermissionStatus> requrestBluetoothScanPermission() async =>
      await Permission.bluetoothScan.request();

  @override
  Future<PermissionStatus> requrestBluetoothConnectPermission() async =>
      await Permission.bluetoothConnect.request();

  //

  @override
  Future<bool> handleCameraPermission() async {
    final cameraPermissionStatus = await requestCameraPermission();

    if (cameraPermissionStatus != PermissionStatus.granted) {
      return await openAppSettings();
    }
    return true;
  }

  @override
  Future<bool> handlePhotosPermission() async {
    final photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      return await openAppSettings();
    }
    return true;
  }

  @override
  Future<bool> handleLocationPermission() async {
    final locationPermissionStatus = await requestLocationPermission();

    if (locationPermissionStatus != PermissionStatus.granted) {
      return await openAppSettings();
    }
    return true;
  }

  @override
  Future<bool> handleNotificationPermission() async {
    final notificationPermissionStatus = await requestNotificationPermission();

    if (notificationPermissionStatus != PermissionStatus.granted) {
      return openAppSettings();
    }
    return true;
  }

  @override
  Future<bool> handleSendSmsPermission() async {
    final sendSmsPermissionStatus = await requestSendSmsPermission();

    if (sendSmsPermissionStatus != PermissionStatus.granted) {
      return openAppSettings();
    }
    return true;
  }

  @override
  Future<bool> handleBluetoothScanPermission() async {
    final bluetoothScanPermissionStatus =
        await requrestBluetoothScanPermission();

    if (bluetoothScanPermissionStatus != PermissionStatus.granted) {
      return openAppSettings();
    }
    return true;
  }

  @override
  Future<bool> handleBluetoothConnectPermission() async {
    final bluetoothConnectPermissionStatus =
        await requrestBluetoothConnectPermission();

    if (bluetoothConnectPermissionStatus != PermissionStatus.granted) {
      return openAppSettings();
    }
    return true;
  }
}
