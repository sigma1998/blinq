import 'package:blinq/app/routes.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigationService.homeNavigatorKey,
      initialRoute: HomeScreen.route,
      onGenerateRoute: onGenerateHomeRoutes,
    );
  }
}
