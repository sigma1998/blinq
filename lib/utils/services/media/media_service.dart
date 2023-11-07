// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:blinq/utils/services/permission/i_permission_service.dart';
import 'i_media_service.dart';

class MediaService extends IMediaService {
  //
  final IPermissionService _permissionService;

  MediaService({
    required IPermissionService permissionService,
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
