import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/data/datasource/local/local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpLocator() {
  /// Register dependencies

  ///data sources
  getIt.registerLazySingleton<AppApi>(() => AppApi());
  getIt.registerLazySingleton(() => LocalStorageImpl());

  ///apis
  getIt.registerLazySingleton<AuthApiImpl>(() => AuthApiImpl(api: getIt()));
  // getIt.registerLazySingleton<ProfileApiImpl>(
  //         () => ProfileApiImpl(myFamilyApi: getIt()));

  ///repositories
  getIt.registerLazySingleton<AuthRepositoryImpl>(() => AuthRepositoryImpl(
      api: getIt<AuthApiImpl>(), localStorage: getIt<LocalStorageImpl>()));
  // getIt.registerLazySingleton<ProfileRepositoryImpl>(
  //         () => ProfileRepositoryImpl(profileApi: getIt<ProfileApiImpl>()));
}
