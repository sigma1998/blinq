// Flutter imports:
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'pages/insurance_company_page.dart';
import 'pages/policy_holder_page.dart';
import 'pages/driver_page.dart';
import 'pages/car_page.dart';

class SecondDriverEditorScreen extends StatelessWidget {
  //
  static const String route = '/second_driver_editor';

  const SecondDriverEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        extendBody: true,
        body: const IndexedStack(
          index: 0,
          children: [
            SecondDriverEditorPolicyHolderPage(),
            SecondDriverEditorCarPage(),
            SecondDriverEditorInsurancePage(),
            SecondDriverEditorPage(),
          ],
        ),
        bottomNavigationBar: NavigationButton(
          height: 16,
          onNextTap: () => NavigationService.pushNamed(
            routeName: SecondDriverEditorScreen.route,
          ),
        ),
      ),
    );
  }
}
