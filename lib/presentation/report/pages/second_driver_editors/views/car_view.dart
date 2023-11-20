// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/number_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';

class SecondDriverEditorCarView extends StatelessWidget {
  //
  const SecondDriverEditorCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 32,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'strInformationCar'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              PickerTextField(
                labelText: 'strMark'.tr(),
                onTap: () {},
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              PickerTextField(
                labelText: 'strModel'.tr(),
                onTap: () {},
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              NameTextField(
                labelText: 'strModelSeries'.tr(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              PickerTextField(
                labelText: 'strColour'.tr(),
                onTap: () {},
                controller: TextEditingController(),
              ),
              const SizedBox(height: 90),

              //~ Motor

              Text(
                'strMotor'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              NameTextField(
                labelText: 'strMakeType'.tr(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              NumberTextField(
                labelText:
                    '${'strRegistrationNumber'.tr()} (${'strMotor'.tr()})',
                controller: TextEditingController(),
              ),
              const SizedBox(height: 16),
              PickerTextField(
                labelText: 'strCountryRegistration'.tr(),
                controller: TextEditingController(),
                onTap: () {},
              ),
              const SizedBox(height: 90),

              //& Trailer

              Text(
                'strTrailer'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 40),
              NumberTextField(
                controller: TextEditingController(),
                labelText: 'strRegistrationNumber'.tr(),
              ),
              const SizedBox(height: 16),
              PickerTextField(
                onTap: () {},
                controller: TextEditingController(),
                labelText: 'strCountryRegistration'.tr(),
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
        Visibility(
          visible: false,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black26,
            child: const Loading(),
          ),
        )
      ],
    );
  }
}
