abstract class IPermissionService {
  Future requestCameraPermission();
  Future requestPhotosPermission();
  Future requestLocationPermission();
  Future requestNotificationPermission();

  //

  Future<bool> handleCameraPermission();
  Future<bool> handlePhotosPermission();
  Future<bool> handleLocationPermission();
  Future<bool> handleNotificationPermission();
}
