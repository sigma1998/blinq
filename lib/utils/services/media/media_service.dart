// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:blinq/utils/services/permission/permission_service.dart';

enum AppImageSource {
  camera,
  gallery,
}

abstract class MediaService {
  Future<String?> pickImagePath(AppImageSource appImageSource);
  Future<List<String>?> pickMultipleImagesPaths();

  Future<String?> pickVideoPath(AppImageSource appImageSource);
  Future<String?> pickMediaPath({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  });

  Future<List<String>?> pickMultipleMediaPaths({
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  });
}

class MediaServiceImpl extends MediaService {
  //
  final PermissionService _permissionService;

  MediaServiceImpl({
    required PermissionService permissionService,
  }) : _permissionService = permissionService;

  @override
  Future<String?> pickImagePath(
    AppImageSource appImageSource, {
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(appImageSource);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final file = await imagePicker.pickImage(
        source: ImageSource.values.byName(appImageSource.name),
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
      );

      if (file != null) {
        return file.path;
      }
    }
    return null;
  }

  @override
  Future<List<String>?> pickMultipleImagesPaths({
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(AppImageSource.gallery);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final files = await imagePicker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (files.isNotEmpty) {
        return files.map((e) => e.path).toList();
      }
    }
    return null;
  }

  @override
  Future<String?> pickVideoPath(
    AppImageSource appImageSource, {
    Duration? maxDuration,
    double? maxWidth,
  }) async {
    bool canProceed = await _handleImagePickPermissions(appImageSource);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final file = await imagePicker.pickVideo(
        source: ImageSource.values.byName(appImageSource.name),
        maxDuration: maxDuration,
      );

      if (file != null) {
        return file.path;
      }
    }
    return null;
  }

  @override
  Future<String?> pickMediaPath({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(AppImageSource.gallery);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final file = await imagePicker.pickMedia(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (file != null) {
        return file.path;
      }
    }
    return null;
  }

  @override
  Future<List<String>?> pickMultipleMediaPaths({
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(AppImageSource.gallery);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final files = await imagePicker.pickMultipleMedia(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (files.isNotEmpty) {
        return files.map((e) => e.path).toList();
      }
    }
    return null;
  }

  //

  Future<bool> _handleImagePickPermissions(AppImageSource imageSource) async {
    if (imageSource == AppImageSource.camera) {
      return await _permissionService.handleCameraPermission();
    } else if (imageSource == AppImageSource.gallery) {
      return await _permissionService.handlePhotosPermission();
    } else {
      return false;
    }
  }
}
