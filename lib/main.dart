import 'package:blinq/app/locator.dart';
import 'package:blinq/core/theme/app_theme.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/presentation/main_screen/main_screen_bloc.dart';
import 'package:blinq/presentation/success_video/success_video_bloc.dart';
import 'package:blinq/utils/image_crop.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app/routes.dart';
import 'data/datasource/local/storage_constants.dart';
import 'data/model/user/user_status.dart';
import 'domain/repositories/profile_repository.dart';
import 'presentation/profile/bloc/profile_bloc.dart';
import 'utils/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  setUpLocator();
  await _setUpHive();
  runApp(EasyLocalization(supportedLocales: const [
    Locale('en'),
    Locale('hu'),
  ], path: 'assets/locale', child: const MyApp()));
}

Future<void> _setUpHive() async {
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(UserStatusAdapter());
  Hive.registerAdapter(DriverLicenseTypeAdapter());
  Hive.registerAdapter(ProfileResponseModelAdapter());

  await Hive.openBox(StorageConstants.appBox);
  await Hive.openBox(StorageConstants.userStatusBox);
}

class MyApp extends StatelessWidget {
  //
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(
          create: (context) => MainScreenBloc(),
        ),
        BlocProvider<SuccessVideoBloc>(
          create: (context) => SuccessVideoBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(
            imageCrop: getIt<ImageCropImpl>(),
            mediaService: getIt<MediaService>(),
            repository: getIt<ProfileRepositoryImpl>(),
          ),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.darkTheme,
        navigatorKey: NavigationService.navigatorKey,
        routes: getRoutes(context),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
