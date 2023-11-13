// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/app/routes.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class Home extends StatelessWidget {
  //
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: HomeScreen.route,
      onGenerateRoute: onGenerateHomeRoutes,
      key: NavigationService.homeNavigatorKey,
    );
  }
}
