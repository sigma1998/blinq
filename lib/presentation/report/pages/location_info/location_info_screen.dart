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
  late final LocationInfoScreenBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = LocationInfoScreenBloc(
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      reportBloc: context.read(),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationInfoScreenBloc, LocationInfoScreenState>(
        bloc: bloc,
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
                        controller: bloc.dateController,
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
                        controller: bloc.timeController,
                      ),
                      const SizedBox(height: 36),
                      PickerTextField(
                        onTap: bloc.onCountryPressed,
                        labelText: 'strCountry'.tr(),
                        controller: bloc.countryController,
                      ),
                      const SizedBox(height: 36),
                      NameTextField(
                        labelText: 'strPlace'.tr(),
                        controller: bloc.placeController,
                      ),
                    ],
                  ),
                  resizeToAvoidBottomInset: true,
                  floatingActionButton:
                      NavigationButton(onNextTap: bloc.onSubmit),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                ),
              ),
            ),
          );
        });
  }
}
