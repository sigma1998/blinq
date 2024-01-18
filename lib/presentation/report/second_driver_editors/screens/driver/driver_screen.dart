// Flutter imports:
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
              body: Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 32,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'strInformationDriver'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
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
                    PhoneTextField(
                      labelText: 'strPhoneNumber'.tr(),
                      controller: cubit.phoneNumberController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: 'strPostalCode'.tr(),
                      controller: cubit.postalCodeController,
                    ),
                    const SizedBox(height: 16),
                    NameTextField(
                      labelText: 'strDrivingLicenseNumber'.tr(),
                      controller: cubit.drivingLicenseNumberController,
                    ),
                    const SizedBox(height: 16),
                    PickerTextField(
                      labelText: 'strCategory'.tr(),
                      controller: cubit.categoryController,
                      onTap: cubit.onSelectCategoryPressed,
                    ),
                    const SizedBox(height: 16),
                    DatePickerTextField(
                      minDate: DateTime.now(),
                      labelText: 'strDrivingLicenceValidTill'.tr(),
                      controller: cubit.licenseDateOfExpiryController,
                    ),
                    const SizedBox(height: 36),
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
