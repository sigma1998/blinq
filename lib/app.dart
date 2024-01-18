// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/app/routes.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'core/theme/app_theme.dart';
import 'domain/repositories/contacts_repository.dart';
import 'domain/repositories/profile_repository.dart';
import 'presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'presentation/main_screen/bloc/main_screen_bloc.dart';
import 'presentation/profile/bloc/profile_bloc.dart';
import 'presentation/report/pages/scan_driver_license/cubit/scan_driver_license_cubit.dart';
import 'presentation/success_video/success_video_bloc.dart';
import 'utils/navigation_service.dart';
import 'utils/services/media/media_service.dart';

class MyApp extends StatefulWidget {
  //
  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();

  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  //
  void updateLocale(String lang) {
    context.setLocale(Locale(lang));
    rebuildAllChildren();
  }

  void rebuildAllChildren() {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  @override
  Widget build(BuildContext context) {
    final profileBloc = ProfileBloc(
      authRepository: getIt<AuthRepositoryImpl>(),
      mediaService: getIt<MediaServiceImpl>(),
      repository: getIt<ProfileRepositoryImpl>(),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(
          create: (context) => MainScreenBloc(),
        ),
        BlocProvider<SuccessVideoBloc>(
          create: (context) => SuccessVideoBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => profileBloc,
        ),
        BlocProvider<ContactsBloc>(
          create: (context) => ContactsBloc(
            repository: getIt<ContactsRepositoryImpl>(),
          ),
        ),
        BlocProvider<PreMadeMessagesBloc>(
          create: (context) => PreMadeMessagesBloc(
            repository: getIt<PremadeMessagesRepositoryImpl>(),
          ),
        ),
        BlocProvider<ConnectToBlinqCubit>(
          create: (context) => ConnectToBlinqCubit(
            permissionService: getIt<PermissionServiceImpl>(),
          ),
        ),
        BlocProvider<ScanDriverLicenseCubit>(
          create: (context) => ScanDriverLicenseCubit(),
        ),
        BlocProvider<ReportBloc>(
          create: (context) => ReportBloc(
            accidentRepository: getIt<AccidentRepositoryImpl>(),
            breakdownRepository: getIt<BreakdownRepositoryImpl>(),
            profileBloc: profileBloc,
          ),
        ),
      ],
      child: MaterialApp(
        locale: context.locale,
        theme: AppTheme.darkTheme,
        routes: getRoutes(context),
        supportedLocales: context.supportedLocales,
        navigatorKey: NavigationService.navigatorKey,
        localizationsDelegates: context.localizationDelegates,
      ),
    );
  }
}
