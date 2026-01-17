// Flutter imports:
import 'package:blinq/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/email_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import '../../../../../core/drawables/app_text_styles.dart';
import '../../../../../utils/components/buttons/regular_button.dart';
import 'bloc/insurance_editor_bloc.dart';
import 'bloc/insurance_editor_event.dart';

class InsuranceEditorScreen extends StatefulWidget {
  //
  static const String route = '/insurance_editor';

  const InsuranceEditorScreen({super.key});

  @override
  State<InsuranceEditorScreen> createState() => _InsuranceEditorScreenState();
}

class _InsuranceEditorScreenState extends State<InsuranceEditorScreen> {
  //

  late InsuranceEditorBloc bloc;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = InsuranceEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );
    bloc.initializeFields();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<InsuranceEditorBloc, InsuranceEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: MyAppBar(title: 'strInsurance'.tr()),
            body: Form(
              key: bloc.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Insurance company information',
                    style: AppTextStyles.s20W600,
                  ),
                  const SizedBox(height: 32),
                  NameTextField(
                    labelText: 'strName'.tr(),
                    controller: bloc.nameController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strPolicyNumber'.tr(),
                    controller: bloc.policyNumberController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strGreenCardNumber'.tr(),
                    controller: bloc.greenCardNumberController,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'strInsuranceCertificateGreenCardValid'.tr(),
                    style: AppTextStyles.s20W600,
                  ),
                  const SizedBox(height: 32),
                  DatePickerTextField(
                    labelText: 'strFrom'.tr(),
                    controller: bloc.certificateValidFromController,
                  ),
                  const SizedBox(height: 16),
                  DatePickerTextField(
                    labelText: 'strTo'.tr(),
                    controller: bloc.certificateValidToController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strAgency'.tr(),
                    controller: bloc.agencyController,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Address',
                    style: AppTextStyles.s20W600,
                  ),
                  const SizedBox(height: 32),
                  PickerTextField(
                    labelText: 'strCountry'.tr(),
                    controller: bloc.countryController,
                    onTap: bloc.onSelectCountriesPressed,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.city.tr(),
                    controller: bloc.cityController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.stateRegion.tr(),
                    controller: bloc.stateController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.street.tr(),
                    controller: bloc.streetController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.zipPostal.tr(),
                    controller: bloc.zipController,
                  ),
                  const SizedBox(height: 16),
                  EmailTextField(
                    controller: bloc.emailController,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Does the policy cover material damage to the vehicle?',
                    style: AppTextStyles.s20W600,
                  ),
                  const SizedBox(height: 32),
                  PickerTextField(
                    labelText: 'strPolicCover'.tr(),
                    onTap: bloc.onPolicyCoverPressed,
                    controller: bloc.policyCoverController,
                  ),
                  const SizedBox(height: 110),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: RegularButton(
                title: 'strSave'.tr(),
                loading: state.status == Status.loading,
                onTap: () {
                  if (bloc.validateForm()) {
                    bloc.add(OnSubmitInsurance());
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
