// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/policy_holder/cubit/second_driver_policy_holder_cubit.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

import '../../../../../core/locale/app_locale.dart';
import '../../../../../core/theme/app_colors.dart';

class SecondDriverEditorPolicyHolderScreen extends StatefulWidget {
  //
  static const String route = '/second_driver_editor_policy_holder';

  const SecondDriverEditorPolicyHolderScreen({super.key});

  @override
  State<SecondDriverEditorPolicyHolderScreen> createState() => _SecondDriverEditorPolicyHolderScreenState();
}

class _SecondDriverEditorPolicyHolderScreenState extends State<SecondDriverEditorPolicyHolderScreen> {
  //
  late SecondDriverPolicyHolderCubit cubit;

  bool sameAsDriver = false;

  @override
  void initState() {
    super.initState();

    cubit = SecondDriverPolicyHolderCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverPolicyHolderCubit, SecondDriverPolicyHolderState>(
      bloc: cubit,
      builder: (context, state) {
        return KeyboardEscape(
          child: ScreenBackground(
            floatingActionButton: NavigationButton(
              padding: 16,
              loading: state.status == Status.loading,
              onNextTap: () {
                if (cubit.validateForm()) {
                  cubit.onSubmit();
                }
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: Column(
              children: [
                const ProgressAppBar(step: 2),
                Expanded(
                  child: Form(
                    key: cubit.formKey,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          'strInformationPolicyHolder'.tr(),
                          style: AppTextStyles.s22W600,
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                AppLocale.sameAsDriver.tr(),
                                style: AppTextStyles.s20W400,
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
                                  cubit.makeSameAsDriver(sameAsDriver);
                                });
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Personal info',
                          style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                        ),
                        const SizedBox(height: 16),
                        NameTextField(
                          labelText: 'strFirstName'.tr(),
                          controller: cubit.firstNameController,
                        ),
                        const SizedBox(height: 16),
                        NameTextField(
                          labelText: 'strLastName'.tr(),
                          controller: cubit.lastNameController,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Address',
                          style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                        ),
                        const SizedBox(height: 16),
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
                          controller: cubit.postalCodeController,
                        ),
                        const SizedBox(height: 16),
                        NameTextField(
                          labelText: AppLocale.phoneNumberEmail.tr(),
                          controller: cubit.phoneEmailController,
                        ),
                        // PhoneTextField(
                        //   labelText: 'Tel/Email',
                        //   controller: cubit.phoneEmailController,
                        // ),
                        const SizedBox(height: 136),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
