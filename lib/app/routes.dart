import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen.dart';
import 'package:blinq/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/sign_in_screen/sign_in_screen.dart';

Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  return {
    SplashScreen.route: (context) => const SplashScreen(),
    MainScreen.route: (context) => const MainScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    EmailScreen.route: (context) => const EmailScreen(),
    RegistrationScreen.route: (context) => const RegistrationScreen(),
  };
}
