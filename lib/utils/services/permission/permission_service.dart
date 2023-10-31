// Package imports:
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'i_permission_service.dart';

class PermissionService extends IPermissionService {
  //
  Future<bool> Function(Future<bool> Function() openAppSettings)
      openSettingsPopUp;

  PermissionService({
    required this.openSettingsPopUp,
  });

  @override
  Future<PermissionStatus> requestCameraPermission() async {
    return await Permission.camera.request();
  }

  @override
  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.photos.request();
  }

  @override
  Future<PermissionStatus> requestLocationPermission() async {
    return await Permission.location.request();
  }

  @override
  Future<bool> handleCameraPermission() async {
    PermissionStatus cameraPermissionStatus = await requestCameraPermission();

    if (cameraPermissionStatus != PermissionStatus.granted) {
      return await openSettingsPopUp(openAppSettings);
    }
    return true;
  }

  @override
  Future<bool> handlePhotosPermission() async {
    PermissionStatus photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      return await openSettingsPopUp(openAppSettings);
    }
    return true;
  }

  @override
  Future<bool> handleLocationPermission() async {
    PermissionStatus locationPermissionStatus =
        await requestLocationPermission();

    if (locationPermissionStatus != PermissionStatus.granted) {
      return await openSettingsPopUp(openAppSettings);
    }
    return true;
  }
}
