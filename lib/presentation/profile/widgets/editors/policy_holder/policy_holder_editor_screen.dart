// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/secondary_button.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';

class PolicyHolderEditorScreen extends StatelessWidget {
  //
  static const String route = '/policy_holder_editor';

  const PolicyHolderEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        appBar: MyAppBar(title: 'strPolicyHolder'.tr()),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 32,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            NameTextField(
              labelText: 'strFirstName'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strLastName'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strAddress'.tr(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            NameTextField(
              labelText: 'strPostalCode'.tr(),
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
