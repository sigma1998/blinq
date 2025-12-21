// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:blinq/app.dart';
import 'package:blinq/app/locator.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/localization.dart';
import 'data/datasource/local/storage_constants.dart';
import 'data/model/user/user_status.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  setUpLocator();

  await _setUpHive();

  await Firebase.initializeApp();

  runApp(const MyLocalization(child: MyApp()));
}

Future<void> _setUpHive() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(UserStatusAdapter());
  Hive.registerAdapter(DriverLicenseTypeAdapter());

  await Hive.openBox(StorageConstants.appBox);
  await Hive.openBox(StorageConstants.userStatusBox);
}
