// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/secondary_button.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';

class InsuranceEditorScreen extends StatelessWidget {
  //
  static const String route = '/insurance_editor';

  const InsuranceEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        appBar: MyAppBar(title: 'strInsurance'.tr()),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 32,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            NameTextField(
              labelText: 'strName'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strPolicyNumber'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strGreenCardNumber'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Text(
              'strInsuranceCertificateGreenCardValid'.tr(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const SizedBox(height: 16),
            DatePickerTextField(
              labelText: 'strFrom'.tr(),
              onDateChanged: (date) {},
            ),
            const SizedBox(height: 16),
            DatePickerTextField(
              labelText: 'strTo'.tr(),
              onDateChanged: (date) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strAgency'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strAddress'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            PickerTextField(
              labelText: 'strCountry'.tr(),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strTelEmail'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            PickerTextField(
              labelText: 'strPolicCover'.tr(),
              onTap: () {},
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SecondaryButton(
                  onTap: () {},
                  label: 'strSave'.tr(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
