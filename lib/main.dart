// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:blinq/app.dart';
import 'package:blinq/app/locator.dart';
import 'package:blinq/data/model/car/response/car_response_model.dart';
import 'package:blinq/data/model/insurance/response/insurance_response_model.dart';
import 'package:blinq/data/model/policy_holder/response/policy_holder_response_model.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/response/vehicle_response_model.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/localization.dart';
import 'data/datasource/local/storage_constants.dart';
import 'data/model/user/user_status.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  setUpLocator();

  await _setUpHive();

  runApp(const MyLocalization(child: MyApp()));
}

Future<void> _setUpHive() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(UserStatusAdapter());
  Hive.registerAdapter(DriverLicenseTypeAdapter());

  Hive.registerAdapter(CarResponseModelAdapter());
  Hive.registerAdapter(PolicyHolderResponseModelAdapter());
  Hive.registerAdapter(InsuranceResponseModelAdapter());
  Hive.registerAdapter(UserVehicleResponseModelAdapter());

  Hive.registerAdapter(ContactResponseModelAdapter());
  Hive.registerAdapter(PremadeMessageResponseModelAdapter());

  Hive.registerAdapter(ProfileResponseModelAdapter());

  await Hive.openBox(StorageConstants.appBox);
  await Hive.openBox(StorageConstants.userStatusBox);
}
