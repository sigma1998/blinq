import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import 'cache_folder.dart';

Future<File?> captureSocialPng(GlobalKey container, BuildContext context) {
  return Future.delayed(const Duration(milliseconds: 20), () async {
    RenderRepaintBoundary? boundary =
        container.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    ui.Image image = await boundary!.toImage();
    final directory = await FileUtil.createFolderInAppDocDir();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile =
        await File('$directory${DateTime.now().millisecondsSinceEpoch}.png')
            .create(recursive: true);
    await imgFile.writeAsBytes(pngBytes);
    return imgFile;
  });
}

Future<File?> captureSign(GlobalKey container, BuildContext context) {
  return Future.delayed(const Duration(milliseconds: 20), () async {
    RenderRepaintBoundary? boundary =
        container.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    ui.Image image = await boundary!.toImage();

    final directory = await FileUtil.createFolderInAppDocDir();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    img.Image? im = img.decodeImage(pngBytes);

    var pixels = im!.getBytes();
    for (int i = 0, len = pixels.length; i < len; i += 4) {
      /// print(
      ///       "r ${pixels[i]} g ${pixels[i + 1]} b ${pixels[i + 2]} a ${pixels[i + 3]} ");

      if (pixels[i] == 27 && pixels[i + 1] == 27 && pixels[i + 2] == 27) {
        /// pixels[i + 3] = 0;
        pixels[i] = 255;
        pixels[i + 1] = 255;
        pixels[i + 2] = 255;
      }
    }

    final png = img.encodePng(im);

    File imgFile =
        await File('$directory${DateTime.now().millisecondsSinceEpoch}.png')
            .create(recursive: true);
    await imgFile.writeAsBytes(png);
    return imgFile;
  });
}

Future<File?> captureImpactPoint(GlobalKey container, BuildContext context) {
  return Future.delayed(const Duration(milliseconds: 20), () async {
    RenderRepaintBoundary? boundary =
    container.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    ui.Image image = await boundary!.toImage();

    final directory = await FileUtil.createFolderInAppDocDir();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    img.Image? im = img.decodeImage(pngBytes);

    var pixels = im!.getBytes();
    for (int i = 0, len = pixels.length; i < len; i += 4) {
      /// print(
      ///       "r ${pixels[i]} g ${pixels[i + 1]} b ${pixels[i + 2]} a ${pixels[i + 3]} ");

      if (pixels[i] == 0 && pixels[i + 1] == 0 && pixels[i + 2] == 0) {
         pixels[i + 3] = 0;
        // pixels[i] = 255;
        // pixels[i + 1] = 255;
        // pixels[i + 2] = 255;
      }
      if (pixels[i] == 255 && pixels[i + 1] == 255 && pixels[i + 2] == 255) {
         // pixels[i + 3] = 0;
        pixels[i] = 0;
        pixels[i + 1] = 0;
        pixels[i + 2] = 0;
      }


    }

    final png = img.encodePng(im);

    File imgFile =
    await File('$directory${DateTime.now().millisecondsSinceEpoch}.png')
        .create(recursive: true);
    await imgFile.writeAsBytes(png);
    return imgFile;
  });
}

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load(path);

  Uint8List pngBytes = byteData.buffer.asUint8List();

  final directory = await FileUtil.createFolderInAppDocDir();

  File imgFile =
      await File('$directory${DateTime.now().millisecondsSinceEpoch}.png')
          .create(recursive: true);
  await imgFile.writeAsBytes(pngBytes);

  return imgFile;
}
