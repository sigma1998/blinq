import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/presentation/report/pages/vehicle_type/vehicle_type_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'speech_to_text_screen_mode.dart';

class SpeechToTextScreenBloc extends Cubit<GenericBlocState> {
  final SpeechToTextScreenMode speechToTextScreenMode;
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  late final String title;

  final TextEditingController textController = TextEditingController();

  SpeechToTextScreenBloc(
      {required this.speechToTextScreenMode,
      required this.reportBloc,
      required this.accidentRepository})
      : super(const GenericBlocState(status: Status.initial)) {
    switch (speechToTextScreenMode) {
      case SpeechToTextScreenMode.remarks:
        title = 'strMyRemarks'.tr();
        break;
      case SpeechToTextScreenMode.witnesses:
        title = 'strAnyWitness'.tr();
        break;
      case SpeechToTextScreenMode.visibleDamage:
        title = 'strVisibleDamage'.tr();
        break;
    }
  }

  void onNextTap() {
    switch (speechToTextScreenMode) {
      case SpeechToTextScreenMode.remarks:
        _onRemarksSubmitted();
        break;
      case SpeechToTextScreenMode.witnesses:
        _onWitnessesSubmitted();
        break;
      case SpeechToTextScreenMode.visibleDamage:
        _onVisibleDamageSubmitted();
        break;
    }
  }

  void _onVisibleDamageSubmitted() async {
    try {
      emit(const GenericBlocState(status: Status.loading));

      await accidentRepository.visibleDamage(
          reportBloc.accidentId, textController.text);
      emit(const GenericBlocState(status: Status.initial));

      NavigationService.pushNamed(
        routeName: SpeechToTextScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
        arguments: SpeechToTextArgs(mode: SpeechToTextScreenMode.remarks),
      );

      emit(const GenericBlocState(status: Status.initial));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  void _onWitnessesSubmitted() async {
    try {
      emit(const GenericBlocState(status: Status.loading));
      await accidentRepository.accidentWitnesses(
          reportBloc.accidentId, textController.text);

      NavigationService.pushNamed(
        routeName: PointsOfImpactScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );

      emit(const GenericBlocState(status: Status.initial));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  void _onRemarksSubmitted() async {
    try {
      emit(const GenericBlocState(status: Status.loading));

      await accidentRepository.myRemarks(
          reportBloc.accidentId, textController.text);
      emit(const GenericBlocState(status: Status.initial));

      NavigationService.pushNamed(
        routeName: VehicleTypeScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );

      emit(const GenericBlocState(status: Status.initial));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }
}
