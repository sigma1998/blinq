import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';

import 'test_screen2.dart';

class TestScreen1 extends StatelessWidget {
  static const String route = '/TestScreen1';

  const TestScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () =>
                NavigationService.pushNamed(routeName: TestScreen2.route,
                nestedKey: NavigationService.homeNavigatorKey
                ),
            child: const Text('TestScreen1')),
      ),
    );
  }
}
