import 'package:blinq/presentation/forgot_password/reset_password/reset_password_screen.dart';
import 'package:blinq/presentation/intro/first_intro_screen/first_intro_screen.dart';
import 'package:blinq/presentation/intro/second_intro_screen/second_intro_screen.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen.dart';
import 'package:blinq/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/presentation/splash_screen/splash_screen.dart';
import 'package:blinq/presentation/success_video/success_video_screen.dart';
import 'package:flutter/material.dart';



Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  return {
    SplashScreen.route: (context) => const SplashScreen(),
    MainScreen.route: (context) => const MainScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    EmailScreen.route: (context) => const EmailScreen(),
    RegistrationScreen.route: (context) => const RegistrationScreen(),
    FirstIntroScreen.route: (context) => const FirstIntroScreen(),
    SecondIntroScreen.route: (context) => const SecondIntroScreen(),
    SuccessVideoScreen.route: (context) => const SuccessVideoScreen(),
    ResetPasswordScreen.route: (context) => const ResetPasswordScreen(),
  };
}
