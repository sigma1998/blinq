abstract class IPermissionService {
  Future requestPhotosPermission();

  Future<bool> handlePhotosPermission();

  Future requestCameraPermission();

  Future<bool> handleCameraPermission();

  Future requestLocationPermission();

  Future<bool> handleLocationPermission();
}
