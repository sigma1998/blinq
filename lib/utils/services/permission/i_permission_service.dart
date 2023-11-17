abstract class IPermissionService {
  Future requestCameraPermission();
  Future requestPhotosPermission();
  Future requestLocationPermission();
  Future requestNotificationPermission();
  Future requestSendSmsPermission();

  //

  Future<bool> handleCameraPermission();
  Future<bool> handlePhotosPermission();
  Future<bool> handleLocationPermission();
  Future<bool> handleNotificationPermission();
  Future<bool> handleSendSmsPermission();
}
