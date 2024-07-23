// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/data/datasource/local/auth_local_db.dart';
import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/datasource/remote/breakdown_api.dart';
import 'package:blinq/data/datasource/remote/contacts_api.dart';
import 'package:blinq/data/datasource/remote/premade_messages_api.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';

import '../utils/services/db/driving_license_type.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  /// Register dependencies

  ///
  /// Data sources
  ///
  getIt.registerLazySingleton<AppApi>(() => AppApi());
  getIt.registerLazySingleton(() => AuthLocalStorageImpl());
  getIt.registerLazySingleton(() => DrivingLicenceTypeDb(getIt()));

  ///
  /// Apis
  ///
  getIt.registerLazySingleton<AuthApiImpl>(() => AuthApiImpl(api: getIt()));
  getIt.registerLazySingleton<ProfileApiImpl>(
      () => ProfileApiImpl(api: getIt()));
  getIt.registerLazySingleton<ContactsApiImpl>(
      () => ContactsApiImpl(api: getIt()));
  getIt.registerLazySingleton<PremadeMessagesApiImpl>(
      () => PremadeMessagesApiImpl(api: getIt()));
  getIt.registerLazySingleton<AccidentApiImpl>(
      () => AccidentApiImpl(api: getIt()));
  getIt.registerLazySingleton<BreakdownApiImpl>(
      () => BreakdownApiImpl(api: getIt()));

  ///
  /// Repositories
  ///
  getIt.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl(
      api: getIt<AuthApiImpl>(), localStorage: getIt<AuthLocalStorageImpl>()));
  getIt.registerLazySingleton<ProfileRepositoryImpl>(
      () => ProfileRepositoryImpl(api: getIt<ProfileApiImpl>()));
  getIt.registerLazySingleton<ContactsRepositoryImpl>(
      () => ContactsRepositoryImpl(api: getIt<ContactsApiImpl>()));
  getIt.registerLazySingleton<PremadeMessagesRepositoryImpl>(() =>
      PremadeMessagesRepositoryImpl(api: getIt<PremadeMessagesApiImpl>()));
  getIt.registerLazySingleton<AccidentRepositoryImpl>(
      () => AccidentRepositoryImpl(api: getIt<AccidentApiImpl>()));
  getIt.registerLazySingleton<BreakdownRepositoryImpl>(
      () => BreakdownRepositoryImpl(breakdownApi: getIt<BreakdownApiImpl>()));

  ///
  /// Permission
  ///
  getIt.registerLazySingleton<PermissionServiceImpl>(
      () => PermissionServiceImpl());
  getIt.registerLazySingleton<MediaServiceImpl>(() =>
      MediaServiceImpl(permissionService: getIt<PermissionServiceImpl>()));
}
