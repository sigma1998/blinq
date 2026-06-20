// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/locale/app_locale.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/app_bar/save_app_bar.dart';
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
import '../../../../../utils/components/wrappers/screen_background.dart';
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
    return ScreenBackground(
      body: KeyboardEscape(
        child: BlocBuilder<DriverEditorBloc, DriverEditorState>(
          bloc: bloc,
          builder: (context, state) {
            return Form(
              key: bloc.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 24),
                physics: const BouncingScrollPhysics(),
                children: [
                  SaveAppBar(
                    title: 'strDriver'.tr(),
                    actionTitle: 'strSave'.tr(),
                    onActionPressed: () {
                      if (bloc.validateForm()) {
                        bloc.add(OnSubmitDriver());
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      children: [
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
                        const SizedBox(height: 16),
                        DatePickerTextField(
                          labelText: 'strDateBirthday'.tr(),
                          maxDate: DateTime.now(),
                          controller: bloc.dateOfBirthController,
                        ),
                        const SizedBox(height: 28),
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
                        const SizedBox(height: 28),
                        Row(
                          children: [
                            Text(
                              'Machine information',
                              style: AppTextStyles.s20W600.copyWith(color: AppColors.c_808080),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
