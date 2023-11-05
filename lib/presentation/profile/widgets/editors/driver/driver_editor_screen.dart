// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';

class DriverEditorScreen extends StatelessWidget {
  //
  static const String route = '/driver_editor';

  const DriverEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return KeyboardEscape(
      child: Scaffold(
        appBar: MyAppBar(title: 'strDriver'.tr()),
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
            DatePickerTextField(
              labelText: 'strDateBirthday'.tr(),
              onDateChanged: (value) {},
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
              minDate: DateTime.now(),
              onDateChanged: (date) {},
            ),
          ],
        ),
        bottomNavigationBar: Row(
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
      ),
    );
  }
}
