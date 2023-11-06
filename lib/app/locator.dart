import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/data/datasource/local/auth_local_db.dart';
import 'package:blinq/data/datasource/local/profile_local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  /// Register dependencies

  ///data sources
  getIt.registerLazySingleton<AppApi>(() => AppApi());
  getIt.registerLazySingleton(() => AuthLocalStorageImpl());
  getIt.registerLazySingleton(() => ProfileLocalStorageImpl());

  ///apis
  getIt.registerLazySingleton<AuthApiImpl>(() => AuthApiImpl(api: getIt()));
  getIt.registerLazySingleton<ProfileApiImpl>(
      () => ProfileApiImpl(api: getIt()));
  // getIt.registerLazySingleton<ProfileApiImpl>(
  //         () => ProfileApiImpl(myFamilyApi: getIt()));

  ///repositories
  getIt.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl(
      api: getIt<AuthApiImpl>(), localStorage: getIt<AuthLocalStorageImpl>()));
  getIt.registerLazySingleton<ProfileRepositoryImpl>(() =>
      ProfileRepositoryImpl(
          api: getIt<ProfileApiImpl>(),
          localStorage: getIt<ProfileLocalStorageImpl>()));

  ///permission
  getIt.registerLazySingleton<PermissionService>(() => PermissionService());
  getIt.registerLazySingleton<MediaService>(
      () => MediaService(permissionService: getIt<PermissionService>()));
}
