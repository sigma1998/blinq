// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/app/routes.dart';
import 'package:blinq/presentation/home/pages/info/info_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class HomeInfo extends StatelessWidget {
  //
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: HomeInfoScreen.route,
      onGenerateRoute: onGenerateInfoRoutes,
      key: NavigationService.homeInfoNavigatorKey,
    );
  }
}
