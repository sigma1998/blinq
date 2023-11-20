// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';

class SecondDriverEditorView extends StatelessWidget {
  //
  const SecondDriverEditorView({super.key});

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
          'strInformationDriver'.tr(),
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
        DatePickerTextField(
          labelText: 'strDateBirthday'.tr(),
          maxDate: DateTime.now(),
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
        PhoneTextField(
          labelText: 'strPhoneNumber'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        NameTextField(
          labelText: 'strDrivingLicenseNumber'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16),
        PickerTextField(
          labelText: 'strCategory'.tr(),
          controller: TextEditingController(),
          onTap: () {},
        ),
        const SizedBox(height: 16),
        DatePickerTextField(
          minDate: DateTime.now(),
          labelText: 'strDrivingLicenceValidTill'.tr(),
          controller: TextEditingController(),
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
