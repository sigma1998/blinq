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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/drawables/app_text_styles.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../utils/components/app_bar/save_app_bar.dart';
import '../../../../../utils/components/buttons/regular_button.dart';
import '../../../../../utils/components/wrappers/screen_background.dart';
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
    return ScreenBackground(
      body: KeyboardEscape(
        child: BlocBuilder<InsuranceEditorBloc, InsuranceEditorState>(
          bloc: bloc,
          builder: (context, state) {
            return Form(
              key: bloc.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  SaveAppBar(
                    title: 'strPolicyHolder'.tr(),
                    actionTitle: 'strSave'.tr(),
                    hPadding: 0,
                    onActionPressed: () {
                      if (bloc.validateForm()) {
                        bloc.add(OnSubmitInsurance());
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Text(
                        'Insurance company information',
                        style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strName'.tr(),
                    controller: bloc.nameController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strPolicyNumber'.tr(),
                    controller: bloc.policyNumberController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strGreenCardNumber'.tr(),
                    controller: bloc.greenCardNumberController,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'strInsuranceCertificateGreenCardValid'.tr(),
                        style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'Address',
                        style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    labelText: 'strCountry'.tr(),
                    controller: bloc.countryController,
                    onTap: bloc.onSelectCountriesPressed,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.city.tr(),
                    controller: bloc.cityController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.stateRegion.tr(),
                    controller: bloc.stateController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.street.tr(),
                    controller: bloc.streetController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.zipPostal.tr(),
                    controller: bloc.zipController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  EmailTextField(
                    controller: bloc.emailController,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Does the policy cover material damage to the vehicle?',
                          style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    labelText: 'strPolicCover'.tr(),
                    onTap: bloc.onPolicyCoverPressed,
                    controller: bloc.policyCoverController,
                  ),
                  const SizedBox(height: 110),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
