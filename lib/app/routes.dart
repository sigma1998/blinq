import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  return {
    SplashScreen.route: (context) => const SplashScreen(),
    MainScreen.route: (context) => const MainScreen(),
  };
}
