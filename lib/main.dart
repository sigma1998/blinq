import 'package:blinq/app/locator.dart';
import 'package:blinq/core/theme/app_theme.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/main_screen/main_screen_bloc.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/routes.dart';
import 'utils/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  setUpLocator();

  runApp(EasyLocalization(supportedLocales: const [
    Locale('en'),
    Locale('hu'),
  ], path: 'assets/locale', child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(
          create: (context) => MainScreenBloc(),
        ),
        BlocProvider<EmailScreenBloc>(
          create: (context) =>
              EmailScreenBloc(authRepository: getIt<AuthRepositoryImpl>()),
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
