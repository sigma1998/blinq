// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/scan_driver_license/cubit/scan_driver_license_cubit.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import '../../../../../core/locale/app_locale.dart';
import '../../../../../core/theme/app_colors.dart';
import 'cubit/second_driver_cubit.dart';

class SecondDriverEditorScreen extends StatefulWidget {
  //
  static const String route = '/second_driver_editor';

  const SecondDriverEditorScreen({super.key});

  @override
  State<SecondDriverEditorScreen> createState() =>
      _SecondDriverEditorScreenState();
}

class _SecondDriverEditorScreenState extends State<SecondDriverEditorScreen> {
  //
  late SecondDriverCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = SecondDriverCubit(
      reportBloc: context.read<ReportBloc>(),
      scanDriverLicenseCubit: context.read<ScanDriverLicenseCubit>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
    );

    cubit.initializeFields();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverCubit, SecondDriverState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: KeyboardEscape(
            child: Scaffold(
              appBar: const ProgressAppBar(step: 1),
              body: Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'strInformationDriver'.tr(),
                      style: AppTextStyles.s22W600,
                    ),
                    const SizedBox(height: 40),
                    NameTextField(
                      labelText: 'strFirstName'.tr(),
                      controller: cubit.firstNameController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: 'strLastName'.tr(),
                      controller: cubit.lastNameController,
                    ),
                    const SizedBox(height: 16),
                    DatePickerTextField(
                      labelText: 'strDateBirthday'.tr(),
                      maxDate: DateTime.now(),
                      controller: cubit.dateOfBirthController,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'strAddress'.tr(),
                          style:AppTextStyles.s22W600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    PickerTextField(
                      labelText: 'strCountry'.tr(),
                      controller: cubit.countryController,
                      onTap: cubit.onSelectCountriesPressed,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: AppLocale.city.tr(),
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
                    PickerTextField(
                      labelText: AppLocale.driverLicenseCountry.tr(),
                      controller: cubit.driverLicenseCountryController,
                      onTap: cubit.onSelectLicenceCountriesPressed,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: 'Zip/${'strPostalCode'.tr()}',
                      controller: cubit.postalCodeController,
                    ),
                    const SizedBox(height: 16),
                    PhoneTextField(
                      labelText: AppLocale.plateNumber.tr(),
                      controller: cubit.phoneNumberController,
                    ),
                    const SizedBox(height: 40),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Machine information',
                          style:AppTextStyles.s20W600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    PickerTextField(
                      labelText: 'strCategory'.tr(),
                      controller: cubit.categoryController,
                      onTap: cubit.onSelectCategoryPressed,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: 'strDrivingLicenseNumber'.tr(),
                      controller: cubit.drivingLicenseNumberController,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocale.noValidityDate.tr(),
                            style: const TextStyle(
                              fontSize: 20,
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
                          value: cubit.noValidity,
                          onChanged: (bool val) {
                            setState(() {
                              cubit.setNoValidity(val);
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 32),
                    DatePickerTextField(
                      minDate: DateTime.now(),
                      labelText: 'strDrivingLicenceValidTill'.tr(),
                      controller: cubit.licenseDateOfExpiryController,
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
