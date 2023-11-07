enum AppImageSource {
  camera,
  gallery,
}

abstract class IMediaService {
  Future<String?> pickImagePath(AppImageSource appImageSource);

  Future<List<String>?> pickMultipleImagesPaths();
}
