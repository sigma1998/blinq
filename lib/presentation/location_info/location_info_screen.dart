import 'package:blinq/utils/custom_widgets/text_fields/rounded/date_picker_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocationInfoScreen extends StatelessWidget {
  //
  static const route = '/location_info';

  const LocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'strDateOfAccident'.tr(),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          RoundedDatePickerTextField(
            controller: TextEditingController(),
            onDateChanged: (date) {},
          ),
        ],
      ),
    );
  }
}
