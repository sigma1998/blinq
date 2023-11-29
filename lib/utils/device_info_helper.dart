// Dart imports:
import 'dart:io' show Platform;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:device_info/device_info.dart';

// Project imports:
import 'package:blinq/utils/md5_helper.dart';

class DeviceInfoHelper {
  //
  static String appId = "";

  static Future<String> getAppId() async {
    if (appId.isNotEmpty) {
      return appId;
    }
    await _deviceDetails();
    return appId;
  }

  static void _produceUUID(String name, String version, String identifier) {
    appId = Md5Helper.toMD5_16(name + version + identifier);
    debugPrint('APPUUID:$appId');
  }

  static Future<void> _deviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        _produceUUID(build.model, build.version.toString(),
            build.androidId); //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        _produceUUID(data.name, data.systemVersion,
            data.identifierForVendor); //UUID for iOS
      }
    } on PlatformException {
      debugPrint('Failed to get platform version');
    }
  }
}
