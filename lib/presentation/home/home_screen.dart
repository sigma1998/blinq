import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            NavigationService.pushNamed(routeName: CreateReportScreen.route),
        child: const Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
