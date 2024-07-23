// Flutter imports:
import 'package:blinq/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/car/cubit/second_driver_car_cubit.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/number_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

class SecondDriverEditorCarScreen extends StatefulWidget {
  //
  static const String route = '/second_driver_editor_car';

  const SecondDriverEditorCarScreen({super.key});

  @override
  State<SecondDriverEditorCarScreen> createState() =>
      _SecondDriverEditorCarScreenState();
}

class _SecondDriverEditorCarScreenState
    extends State<SecondDriverEditorCarScreen> {
  //
  late SecondDriverCarCubit cubit;

  @override
  void initState() {
    cubit = SecondDriverCarCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      profileRepository: getIt<ProfileRepositoryImpl>(),
    );
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverCarCubit, SecondDriverCarState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: KeyboardEscape(
            child: Scaffold(
              body: Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 32,
                  ),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'strInformationCar'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 40),
                      // PickerTextField(
                      //   labelText: 'strVehicleType'.tr(),
                      //   onTap: cubit.onVehicleTypeTap,
                      //   controller: cubit.vehicleTypeController,
                      // ),
                      // const SizedBox(height: 16),
                      PickerTextField(
                        labelText: 'strMark'.tr(),
                        onTap: cubit.onBrandTap,
                        controller: cubit.markController,
                      ),
                      const SizedBox(height: 16),
                      PickerTextField(
                        labelText: 'strModel'.tr(),
                        onTap: cubit.onModelTap,
                        controller: cubit.modelController,
                      ),
                      const SizedBox(height: 16),
                      NameTextField(
                        labelText: 'strModelSeries'.tr(),
                        controller: cubit.modelSeriesController,
                      ),
                      const SizedBox(height: 16),
                      PickerTextField(
                        labelText: 'strColour'.tr(),
                        onTap: cubit.onColorTap,
                        controller: cubit.colorController,
                      ),
                      const SizedBox(height: 90),

                      //~ Motor

                      Text(
                        'strMotor'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 40),
                      NameTextField(
                        labelText: 'strMakeType'.tr(),
                        controller: cubit.makeTypeController,
                      ),
                      const SizedBox(height: 16),
                      NameTextField(
                        labelText: AppLocale.plateNumber.tr(),
                        controller: cubit.plateNumberController,
                      ),
                      const SizedBox(height: 16),
                      NumberTextField(
                        labelText:
                            '${'strRegistrationNumber'.tr()} (${'strMotor'.tr()})',
                        controller: cubit.engineNumberController,
                      ),
                      const SizedBox(height: 16),
                      PickerTextField(
                        labelText: 'strCountryRegistration'.tr(),
                        onTap: cubit.onSelectCountryOfRegistrationPressed,
                        controller: cubit.countryOfRegistrationController,
                      ),
                      const SizedBox(height: 36),
                    ],
                  ),
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
