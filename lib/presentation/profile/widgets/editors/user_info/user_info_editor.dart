// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';

class ProfileUserInfoEditor extends StatelessWidget {
  //
  const ProfileUserInfoEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      isEdit: true,
      child: Column(
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
          DatePickerTextField(
            labelText: 'strDateBirthday'.tr(),
            onTap: () {},
            onDateChanged: (value) {},
            initialDate: DateTime.now(),
            maxDate: DateTime.now(),
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
          PhoneTextField(
            labelText: 'strPhoneNumber'.tr(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          NameTextField(
            labelText: 'strDrivingLicenseNumber'.tr(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          PickerTextField(
            labelText: 'strCategory'.tr(),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          DatePickerTextField(
            labelText: 'strDrivingLicenceValidTill'.tr(),
            onTap: () {},
            minDate: DateTime.now(),
            onDateChanged: (date) {},
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
    );
  }
}
