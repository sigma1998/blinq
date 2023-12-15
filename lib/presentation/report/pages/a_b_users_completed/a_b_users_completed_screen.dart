import 'package:blinq/presentation/report/pages/circumstances/circumstances_screen.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ABUsersCompletedScreen extends StatelessWidget {
  static const String route = '/a_b_users_completed';

  const ABUsersCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepIndicator(
                  currentStep: 14,
                ),
                const SizedBox(
                  height: 52,
                ),
                Text(
                  'strABCompleted'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'strPartsCommon'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.outline),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: NavigationButton(
              onNextTap: () {
                NavigationService.pushNamed(
                    routeName: CircumstancesScreen.route,
                    nestedKey: NavigationService.homeNavigatorKey);
              },
            ),
          )
        ],
      ),
    );
  }
}
