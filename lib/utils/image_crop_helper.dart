// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_cropper/image_cropper.dart';

// Project imports:
import 'package:blinq/core/theme/app_colors.dart';

class ImageCropHelper {
  //
  static Future<File> cropImage(String? imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath ?? '',
      aspectRatioPresets: [CropAspectRatioPreset.original],
      aspectRatio: const CropAspectRatio(ratioX: 9, ratioY: 16),
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: false,
          toolbarTitle: 'Cropper',
          toolbarWidgetColor: Colors.white,
          toolbarColor: AppColors.primaryColor,
          initAspectRatio: CropAspectRatioPreset.original,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    return File(croppedFile?.path ?? '');
  }
}
