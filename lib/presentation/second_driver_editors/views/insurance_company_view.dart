// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';

class SecondDriverEditorInsuranceView extends StatelessWidget {
  //
  const SecondDriverEditorInsuranceView({super.key});

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
          'strInformationAboutInsuranceCompany'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 40),
        NameTextField(
          labelText: 'strName'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strPolicyNumber'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strGreenCardNumber'.tr(),
          controller: TextEditingController(),
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
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        DatePickerTextField(
          labelText: 'strTo'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strAgency'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strAddress'.tr(),
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
        const SizedBox(height: 16),
        PickerTextField(
          labelText: 'strPolicCover'.tr(),
          onTap: () {},
          controller: TextEditingController(),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
