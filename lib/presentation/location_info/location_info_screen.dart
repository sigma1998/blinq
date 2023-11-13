// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/rounded/time_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/presentation/injury/injury_screen.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/navigation_service.dart';

class LocationInfoScreen extends StatelessWidget {
  //
  static const route = '/location_info';

  const LocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        extendBody: true,
        body: ListView(
          padding: const EdgeInsets.all(32),
          physics: const ClampingScrollPhysics(),
          children: [
            Text(
              'strDateOfAccident'.tr(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            RoundedDatePickerTextField(
              controller: TextEditingController(),
              onDateChanged: (date) {},
              maxDate: DateTime.now(),
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
              controller: TextEditingController(),
              onDateChanged: (date) {},
            ),
            const SizedBox(height: 36),
            PickerTextField(
              labelText: 'strCountry'.tr(),
              controller: TextEditingController(),
              onTap: () {},
            ),
            const SizedBox(height: 36),
            NameTextField(
              labelText: 'strPlace'.tr(),
              controller: TextEditingController(),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButton: NavigationButton(
          onNextTap: () => NavigationService.pushNamed(
            routeName: InjuryScreen.route,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
