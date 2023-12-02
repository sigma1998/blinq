// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/insurance_company/cubit/second_driver_insurance_cubit.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';

class SecondDriverEditorInsuranceScreen extends StatefulWidget {
  //
  static const String route = '/second_driver_editor_insurance';

  const SecondDriverEditorInsuranceScreen({super.key});

  @override
  State<SecondDriverEditorInsuranceScreen> createState() =>
      _SecondDriverEditorInsuranceScreenState();
}

class _SecondDriverEditorInsuranceScreenState
    extends State<SecondDriverEditorInsuranceScreen> {
  //
  late SecondDriverInsuranceCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = SecondDriverInsuranceCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverInsuranceCubit, SecondDriverInsuranceState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: KeyboardEscape(
            child: Scaffold(
              body: ListView(
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
                    controller: cubit.nameController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strPolicyNumber'.tr(),
                    controller: cubit.policyNumberController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strGreenCardNumber'.tr(),
                    controller: cubit.greenCardNumberController,
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
                    controller: cubit.certificateValidFromController,
                  ),
                  const SizedBox(height: 16),
                  DatePickerTextField(
                    labelText: 'strTo'.tr(),
                    controller: cubit.certificateValidToController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strAgency'.tr(),
                    controller: cubit.agencyController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strAddress'.tr(),
                    controller: cubit.addressController,
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    labelText: 'strCountry'.tr(),
                    controller: cubit.countryController,
                    onTap: cubit.onSelectCountriesPressed,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strTelEmail'.tr(),
                    controller: cubit.emailController,
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    labelText: 'strPolicCover'.tr(),
                    onTap: cubit.onPolicyCoverPressed,
                    controller: cubit.policyCoverController,
                  ),
                  const SizedBox(height: 36),
                ],
              ),
              floatingActionButton: NavigationButton(
                onNextTap: cubit.onSubmit,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}
