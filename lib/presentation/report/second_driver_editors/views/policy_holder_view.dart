// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';

class SecondDriverEditorPolicyHolderView extends StatelessWidget {
  //
  const SecondDriverEditorPolicyHolderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 32,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          'strInformationPolicyHolder'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 40),
        NameTextField(
          labelText: 'strFirstName'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strLastName'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strAddress'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strPostalCode'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        PickerTextField(
          labelText: 'strCountry'.tr(),
          controller: TextEditingController(),
          onTap: () {},
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strTelEmail'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
