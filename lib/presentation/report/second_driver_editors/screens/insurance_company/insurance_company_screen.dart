// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
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
import 'package:blinq/utils/custom_widgets/text_fields/email_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

import '../../../../../core/locale/app_locale.dart';

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
              appBar: ProgressAppBar(step: 3),
              body: Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'strInformationAboutInsuranceCompany'.tr(),
                      style: AppTextStyles.s22W600,
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
                    const SizedBox(height: 40),
                    Text(
                      'strInsuranceCertificateGreenCardValid'.tr(),
                      style: AppTextStyles.s22W600,
                    ),
                    const SizedBox(height: 36),
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
                    const SizedBox(height: 40),
                    const Text(
                      'Address',
                      style: AppTextStyles.s22W600,
                    ),
                    const SizedBox(height: 36),
                    PickerTextField(
                      labelText: 'strCountry'.tr(),
                      controller: cubit.countryController,
                      onTap: cubit.onSelectCountriesPressed,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: AppLocale.city.tr(), //'strAddress'.tr(),
                      controller: cubit.cityController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: AppLocale.stateRegion.tr(),
                      controller: cubit.stateController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: AppLocale.street.tr(),
                      controller: cubit.streetController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: AppLocale.zipPostal.tr(),
                      controller: cubit.zipController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: AppLocale.phoneNumberEmail.tr(),
                      controller: cubit.phoneNumberController,
                    ),
                    // PhoneTextField(
                    //   labelText: 'strPhoneNumber'.tr(),
                    //   controller: cubit.phoneNumberController,
                    // ),
                    // const SizedBox(height: 16),
                    // EmailTextField(
                    //   controller: cubit.emailController,
                    // ),
                    const SizedBox(height: 40),
                    const Text(
                      'Does the policy cover material damage to the vehicle?',
                      style: AppTextStyles.s22W600,
                    ),
                    const SizedBox(height: 36),
                    PickerTextField(
                      labelText: 'strPolicCover'.tr(),
                      onTap: cubit.onPolicyCoverPressed,
                      controller: cubit.policyCoverController,
                    ),
                    const SizedBox(height: 136),
                  ],
                ),
              ),
              floatingActionButton: NavigationButton(
                onNextTap: () {
                  if (cubit.validateForm()) {
                    cubit.onSubmit();
                  }
                },
                loading: state.status == Status.loading,
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
