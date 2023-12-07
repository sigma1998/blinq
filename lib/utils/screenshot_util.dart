import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'cache_folder.dart';

Future<File?> captureSocialPng(GlobalKey container, BuildContext context) {
  return Future.delayed(const Duration(milliseconds: 20), () async {
    RenderRepaintBoundary? boundary =
        container.currentContext!.findRenderObject() as RenderRepaintBoundary?;

    // if (boundary?.debugNeedsLayout == true) {
    //   NavigationService.showErrorToast('Debug Needs Layout');
    //   return null;
    // }

    /// if it needs repaint, we paint it.
    /// it appears only in debug mode
    /// in profile/release mode should work fine
    /// comment it in release mode!!!
    if (boundary?.debugNeedsPaint ?? true) {
      await Future.delayed(const Duration(milliseconds: 500));
      // ignore: use_build_context_synchronously
      return await captureSocialPng(container, context);
    }

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
