// Flutter imports:
import 'package:blinq/utils/speech_to_text/speech_to_text.dart';
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

  await setUpSpeechRecognition();

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

Future<void> setUpSpeechRecognition() async {
  await SpeechToText().initialize(
    finalTimeout: const Duration(milliseconds: 500),
    onStatus: (String status) {
      print('STATUS___________________$status');
    },
    onError: (e) => print('Error speech:____________________ ${e}'),
  );
}
