// Flutter imports:
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'views/insurance_company_view.dart';
import 'views/policy_holder_view.dart';
import 'views/driver_view.dart';
import 'views/car_view.dart';

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
            SecondDriverEditorPolicyHolderView(),
            SecondDriverEditorCarView(),
            SecondDriverEditorInsuranceView(),
            SecondDriverEditorView(),
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
