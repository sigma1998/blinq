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
import '../../../../../core/theme/app_colors.dart';
import '../../../../../utils/states/action_type.dart';
import 'bloc/policy_holder_editor_bloc.dart';
import 'bloc/policy_holder_editor_event.dart';

class PolicyHolderEditorScreen extends StatefulWidget {
  //
  static const String route = '/policy_holder_editor';

  const PolicyHolderEditorScreen({super.key});

  @override
  State<PolicyHolderEditorScreen> createState() =>
      _PolicyHolderEditorScreenState();
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
    return KeyboardEscape(
      child: BlocBuilder<PolicyHolderEditorBloc, PolicyHolderEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: MyAppBar(title: 'strPolicyHolder'.tr()),
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
                        // Set transparent so the active track color shows through
                        // activeTrackColor: AppColors.grey2,
                        // thumbColor: MaterialStateProperty.resolveWith<Color?>(
                        //   (Set<MaterialState> states) {
                        //     return Colors.white;
                        //   },
                        // ),
                        // // Background color when switch is on
                        // inactiveThumbColor: AppColors.grey2,
                        // // Round color when switch is off
                        // inactiveTrackColor: AppColors.grey1,
                        // Set transparent so the inactive thumb color shows through
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
                  const SizedBox(height: 40),
                  const Text(
                    'Personal info',
                    style: AppTextStyles.s20W600,
                  ),
                  const SizedBox(height: 32),
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
            ),
            bottomNavigationBar: SafeArea(
              child: RegularButton(
                title: 'strSave'.tr(),
                loading: state.status == Status.loading,
                onTap: () {
                  if (bloc.validateForm()) {
                    bloc.add(OnSubmitPolicyHolder());
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
