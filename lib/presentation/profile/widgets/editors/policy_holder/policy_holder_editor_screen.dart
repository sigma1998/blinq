// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/locale/app_locale.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/email_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../utils/components/app_bar/save_app_bar.dart';
import '../../../../../utils/components/wrappers/screen_background.dart';
import '../../../../../utils/states/action_type.dart';
import 'bloc/policy_holder_editor_bloc.dart';
import 'bloc/policy_holder_editor_event.dart';

class PolicyHolderEditorScreen extends StatefulWidget {
  //
  static const String route = '/policy_holder_editor';

  const PolicyHolderEditorScreen({super.key});

  @override
  State<PolicyHolderEditorScreen> createState() => _PolicyHolderEditorScreenState();
}

class _PolicyHolderEditorScreenState extends State<PolicyHolderEditorScreen> {
  //
  late final PolicyHolderEditorBloc bloc;
  bool sameAsDriver = false;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = PolicyHolderEditorBloc(
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
        child: BlocBuilder<PolicyHolderEditorBloc, PolicyHolderEditorState>(
          bloc: bloc,
          builder: (context, state) {
            return Form(
              key: bloc.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                physics: const BouncingScrollPhysics(),
                children: [
                  SaveAppBar(
                    title: 'strPolicyHolder'.tr(),
                    actionTitle: 'strSave'.tr(),
                    hPadding: 0,
                    onActionPressed: () {
                      if (bloc.validateForm()) {
                        bloc.add(OnSubmitPolicyHolder());
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          AppLocale.sameAsDriver.tr(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        activeColor: AppColors.grey2,
                        value: sameAsDriver,
                        onChanged: (bool val) {
                          setState(() {
                            sameAsDriver = !sameAsDriver;
                            bloc.makeSameAsDriver(sameAsDriver);
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'Personal info',
                        style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strFirstName'.tr(),
                    controller: bloc.firstNameController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strLastName'.tr(),
                    controller: bloc.lastNameController,
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
                    labelText: AppLocale.city.tr(), //'strAddress'.tr(),
                    controller: bloc.cityController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.stateRegion.tr(), //'strAddress'.tr(),
                    controller: bloc.stateController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.street.tr(), //'strAddress'.tr(),
                    controller: bloc.streetController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.zipPostal.tr(),
                    controller: bloc.postalCodeController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.phoneNumberEmail.tr(),
                    //'strAddress'.tr(),
                    controller: bloc.emailController,
                  ),
                  // const SizedBox(height: 16),
                  // EmailTextField(
                  //   controller: bloc.emailController,
                  // ),
                  const SizedBox(height: 90),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
