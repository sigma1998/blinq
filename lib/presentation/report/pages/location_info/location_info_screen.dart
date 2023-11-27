// Flutter imports:
import 'package:blinq/presentation/report/pages/injury/injury_screen.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/rounded/time_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/navigation_service.dart';

class LocationInfoScreen extends StatelessWidget {
  //
  static const route = '/location_info';

  const LocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          body: ListView(
            padding: const EdgeInsets.all(32).copyWith(bottom: 120),
            physics: const ClampingScrollPhysics(),
            children: [
              StepIndicator(
                title: 'strBreakDown'.tr(),
              ),
              const SizedBox(height: 52),
              Text(
                'strDateOfAccident'.tr(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              RoundedDatePickerTextField(
                maxDate: DateTime.now(),
                initialDate: DateTime.now(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 36),
              Text(
                'strTimeOfAccident'.tr(),
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              RoundedTimePickerTextField(
                initialTime: TimeOfDay.now(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 36),
              PickerTextField(
                onTap: () {},
                labelText: 'strCountry'.tr(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 36),
              NameTextField(
                labelText: 'strPlace'.tr(),
                controller: TextEditingController(),
              ),
            ],
          ),
          resizeToAvoidBottomInset: true,
          floatingActionButton: NavigationButton(
            onNextTap: () => NavigationService.pushNamed(
              routeName: InjuryScreen.route,
              nestedKey: NavigationService.homeNavigatorKey
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
