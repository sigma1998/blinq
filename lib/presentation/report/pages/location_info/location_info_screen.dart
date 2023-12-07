// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_bloc.dart';
import 'package:blinq/presentation/report/pages/location_info/bloc/location_info_screen_state.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/modal_progress_hud.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/rounded/time_picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/step_indicator.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationInfoScreen extends StatefulWidget {
  //
  static const route = '/location_info';

  const LocationInfoScreen({super.key});

  @override
  State<LocationInfoScreen> createState() => _LocationInfoScreenState();
}

class _LocationInfoScreenState extends State<LocationInfoScreen> {
  //
  late final LocationInfoScreenCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = LocationInfoScreenCubit(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      reportBloc: context.read(),
    );

    cubit.init();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationInfoScreenCubit, LocationInfoScreenState>(
        bloc: cubit,
        builder: (context, state) {
          return KeyboardEscape(
            child: SafeArea(
              child: ModalProgressHud(
                isLoading: state.status == Status.loading,
                child: Scaffold(
                  extendBody: true,
                  body: ListView(
                    padding: const EdgeInsets.all(32).copyWith(bottom: 120),
                    physics: const ClampingScrollPhysics(),
                    children: [
                      const StepIndicator(currentStep: 1),
                      const SizedBox(height: 52),
                      Text(
                        'strDateOfAccident'.tr(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      RoundedDatePickerTextField(
                        maxDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        controller: cubit.dateController,
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'strTimeOfAccident'.tr(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      RoundedTimePickerTextField(
                        initialTime: TimeOfDay.now(),
                        controller: cubit.timeController,
                      ),
                      const SizedBox(height: 36),
                      PickerTextField(
                        onTap: cubit.onCountryPressed,
                        labelText: 'strCountry'.tr(),
                        controller: cubit.countryController,
                      ),
                      const SizedBox(height: 36),
                      NameTextField(
                        labelText: 'strPlace'.tr(),
                        maxLines: 3,
                        controller: cubit.placeController,
                      ),
                    ],
                  ),
                  resizeToAvoidBottomInset: true,
                  floatingActionButton:
                      NavigationButton(onNextTap: cubit.onSubmit),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                ),
              ),
            ),
          );
        });
  }
}
