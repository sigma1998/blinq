// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/data/datasource/local/auth_local_db.dart';
import 'package:blinq/data/datasource/local/contacts_local_db.dart';
import 'package:blinq/data/datasource/local/premade_messages_local_db.dart';
import 'package:blinq/data/datasource/local/profile_local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/datasource/remote/contacts_api.dart';
import 'package:blinq/data/datasource/remote/premade_messages_api.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  /// Register dependencies

  ///
  /// Data sources
  ///
  getIt.registerLazySingleton<AppApi>(() => AppApi());
  getIt.registerLazySingleton(() => AuthLocalStorageImpl());
  getIt.registerLazySingleton(() => ProfileLocalStorageImpl());
  getIt.registerLazySingleton(() => ContactsLocalStorageImpl());
  getIt.registerLazySingleton(() => PremadeMessagesLocalStorageImpl());

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

  ///
  /// Repositories
  ///
  getIt.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl(
      api: getIt<AuthApiImpl>(), localStorage: getIt<AuthLocalStorageImpl>()));
  getIt.registerLazySingleton<ProfileRepositoryImpl>(() =>
      ProfileRepositoryImpl(
          api: getIt<ProfileApiImpl>(),
          localStorage: getIt<ProfileLocalStorageImpl>()));
  getIt.registerLazySingleton<ContactsRepositoryImpl>(() =>
      ContactsRepositoryImpl(
          api: getIt<ContactsApiImpl>(),
          localStorage: getIt<ContactsLocalStorageImpl>()));
  getIt.registerLazySingleton<PremadeMessagesRepositoryImpl>(() =>
      PremadeMessagesRepositoryImpl(
          api: getIt<PremadeMessagesApiImpl>(),
          localStorage: getIt<PremadeMessagesLocalStorageImpl>()));
  getIt.registerLazySingleton<AccidentRepositoryImpl>(
      () => AccidentRepositoryImpl(api: getIt<AccidentApiImpl>()));

  ///
  /// Permission
  ///
  getIt.registerLazySingleton<PermissionService>(() => PermissionService());
  getIt.registerLazySingleton<MediaService>(
      () => MediaService(permissionService: getIt<PermissionService>()));
}
