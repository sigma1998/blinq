import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
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

  void _onWitnessesSubmitted() async {
    try {
      emit(const GenericBlocState(status: Status.loading));
      await accidentRepository.accidentWitnesses(
          reportBloc.reportId, textController.text);

      NavigationService.pushNamed(
        routeName: PointsOfImpactScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );

      emit(const GenericBlocState(status: Status.initial));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  void _onVisibleDamageSubmitted() async {
    try {
      emit(const GenericBlocState(status: Status.loading));

      await _sendVisibleDamage();

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

  Future<void> _sendVisibleDamage() async {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.user == User.A) {
        await accidentRepository.visibleDamage(
            reportBloc.reportId, textController.text);
      } else {
        await accidentRepository.visibleDamageB(
            reportBloc.reportId, textController.text);
      }
    } else {
      //TODo
    }
  }

  void _onRemarksSubmitted() async {
    try {
      emit(const GenericBlocState(status: Status.loading));

      await _sendRemarks();

      final VehicleType vehicleType;

      if (reportBloc.user == User.A) {
        vehicleType = reportBloc.aDriverVehicleType;
      } else {
        vehicleType = await accidentRepository
            .getSecondDriverVehicleType(reportBloc.reportId);
      }

      emit(const GenericBlocState(status: Status.initial));

      NavigationService.pushNamed(
        routeName: DamagedPartsScreen.route,
        arguments: DamagedPartsScreenArgs(vehicleType: vehicleType),
        nestedKey: NavigationService.homeNavigatorKey,
      );

      emit(const GenericBlocState(status: Status.initial));
    } catch (e) {
      emit(const GenericBlocState(status: Status.initial));
    }
  }

  int getStep() {
    if (speechToTextScreenMode == SpeechToTextScreenMode.witnesses) {
      return 3;
    }
    if (speechToTextScreenMode == SpeechToTextScreenMode.visibleDamage) {
      if (reportBloc.user == User.A) {
        return 5;
      } else {
        return 10;
      }
    } else {
      if (reportBloc.user == User.A) {
        return 6;
      } else {
        return 11;
      }
    }
  }

  Future<void> _sendRemarks() async {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.user == User.A) {
        await accidentRepository.myRemarks(
            reportBloc.reportId, textController.text);
      } else {
        await accidentRepository.myRemarksB(
            reportBloc.reportId, textController.text);
      }
    } else {
      //TODo
    }
  }
}
