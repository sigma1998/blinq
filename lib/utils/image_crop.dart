import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:image_cropper/image_cropper.dart';

abstract class ImageCrop {
  Future<File> cropImage(String? imagePath);
}

class ImageCropImpl implements ImageCrop {
  //
  @override
  Future<File> cropImage(String? imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath ?? '',
      aspectRatioPresets: [CropAspectRatioPreset.original],
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: false,
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
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
