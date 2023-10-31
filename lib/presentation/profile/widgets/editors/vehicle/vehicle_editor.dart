// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/number_text_field.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';

class ProfileVehicleEditor extends StatelessWidget {
  //
  const ProfileVehicleEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      isEdit: true,
      child: Column(
        children: [
          NumberTextField(
            labelText: 'strMilesTravelled'.tr(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          NumberTextField(
            labelText: 'strNextTechnicalInspection'.tr(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          NumberTextField(
            labelText: 'strLastOilReplacementDate'.tr(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          DatePickerTextField(
            labelText: 'strLastBatteryReplacementDate'.tr(),
            onTap: () {},
            maxDate: DateTime.now(),
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
