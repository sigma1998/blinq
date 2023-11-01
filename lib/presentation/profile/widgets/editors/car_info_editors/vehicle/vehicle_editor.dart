// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';

class ProfileCarInfoVehicleEditor extends StatelessWidget {
  //
  const ProfileCarInfoVehicleEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      child: Column(
        children: [
          NameTextField(
            labelText: 'strMakeType'.tr(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          NameTextField(
            labelText: '${'strRegistrationNumber'.tr()} (${'strMotor'.tr()})',
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          PickerTextField(
            labelText: 'strCountryRegistration'.tr(),
            onTap: () {},
          ),
          const SizedBox(height: 16),
          NameTextField(
            labelText: '${'strRegistrationNumber'.tr()} (${'strTrailer'.tr()})',
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          PickerTextField(
            labelText:
                '${'strCountryRegistration'.tr()} (${'strTrailer'.tr()})',
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
    );
  }
}
