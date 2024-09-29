// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/locale/app_locale.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/states/action_type.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/driver_editor_bloc.dart';
import 'bloc/driver_editor_event.dart';

class DriverEditorScreen extends StatefulWidget {
  //
  static const String route = '/driver_editor';

  const DriverEditorScreen({super.key});

  @override
  State<DriverEditorScreen> createState() => _DriverEditorScreenState();
}

class _DriverEditorScreenState extends State<DriverEditorScreen> {
  ///
  /// /// Driver
  ///
  late DriverEditorBloc bloc;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = DriverEditorBloc(profileBloc: profileBloc);
    bloc.initializeFields();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<DriverEditorBloc, DriverEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: MyAppBar(title: 'strDriver'.tr()),
            body: Form(
              key: bloc.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  const Text(
                    'Information about the driver',
                    style: AppTextStyles.s22W600,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Personal info',
                    style: AppTextStyles.s22W600,
                  ),
                  const SizedBox(height: 32),
                  NameTextField(
                    labelText: 'strFirstName'.tr(),
                    controller: bloc.firstNameController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strLastName'.tr(),
                    controller: bloc.lastNameController,
                  ),
                  const SizedBox(height: 16),
                  DatePickerTextField(
                    labelText: 'strDateBirthday'.tr(),
                    maxDate: DateTime.now(),
                    controller: bloc.dateOfBirthController,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Address',
                    style: AppTextStyles.s22W600,
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
                  PickerTextField(
                    labelText: AppLocale.driverLicenseCountry.tr(),
                    controller: bloc.driverLicenseCountryController,
                    onTap: bloc.onSelectLicenceCountriesPressed,
                  ),
                  const SizedBox(height: 16),
                  PhoneTextField(
                    labelText: 'strPhoneNumber'.tr(),
                    controller: bloc.phoneNumberController,
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Machine information',
                    style: AppTextStyles.s22W600,
                  ),
                  const SizedBox(height: 36),
                  PickerTextField(
                    labelText: 'strCategory'.tr(),
                    controller: bloc.categoryController,
                    onTap: bloc.onSelectCategoryPressed,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strDrivingLicenseNumber'.tr(),
                    controller: bloc.drivingLicenseNumberController,
                  ),
                  const SizedBox(height: 32),
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
                      Switch(
                        activeColor: AppColors.grey2,
                        // Set transparent so the active track color shows through
                        activeTrackColor: AppColors.grey2,
                        thumbColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Colors.white;
                          },
                        ),
                        // Background color when switch is on
                        inactiveThumbColor: AppColors.grey2,
                        // Round color when switch is off
                        inactiveTrackColor: AppColors.grey1,
                        // Set transparent so the inactive thumb color shows through
                        value: bloc.noValidity,
                        onChanged: (bool val) {
                          setState(() {
                            bloc.setNoValidity(val);
                          });
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 32),
                  DatePickerTextField(
                    minDate: DateTime.now(),
                    labelText: 'strDrivingLicenceValidTill'.tr(),
                    controller: bloc.licenseDateOfExpiryController,
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RegularButton(
                loading: state.status == Status.loading,
                title: 'strSave'.tr(),
                onTap: () {
                  if (bloc.validateForm()) {
                    bloc.add(OnSubmitDriver());
                  }
                },
              ),
            ),
            // bottomNavigationBar: Padding(
            //   padding: const EdgeInsets.only(bottom: 60),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       MyButton.primary(
            //         label: 'strSave'.tr(),
            //         onTap: () {
            //           if (bloc.validateForm()) {
            //             bloc.add(OnSubmitDriver());
            //           }
            //         },
            //         padding: const EdgeInsets.symmetric(
            //           vertical: 8,
            //           horizontal: 60,
            //         ),
            //         isLoading: state.status == Status.loading,
            //         labelStyle: const TextStyle(fontWeight: FontWeight.w500),
            //       ),
            //     ],
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
