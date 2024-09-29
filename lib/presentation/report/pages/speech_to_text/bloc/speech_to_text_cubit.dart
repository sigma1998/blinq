// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/circumstances/circumstances_screen.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/speech_to_text/speech_to_text.dart';
import 'speech_to_text_screen_mode.dart';

part 'speech_to_text_cubit.freezed.dart';

part 'speech_to_text_state.dart';

class SpeechToTextCubit extends Cubit<SpeechToTextState> {
  //
  final SpeechToTextScreenMode speechToTextScreenMode;
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;
  final ReportBloc reportBloc;

  late final String title;

  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  SpeechToText speechToText = SpeechToText();

  SpeechToTextCubit({
    required this.speechToTextScreenMode,
    required this.reportBloc,
    required this.accidentRepository,
    required this.breakdownRepository,
  }) : super(const SpeechToTextState()) {
    initializeSpeechToText();

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

  //

  void initializeSpeechToText() async {
    await speechToText.initialize(
      finalTimeout: const Duration(milliseconds: 500),
      onStatus: (String status) {
        print('INITIALIZED________________$status');
        if (status == 'listening') {
          emit(state.copyWith(isRecording: true));
        } else {
          emit(state.copyWith(isRecording: false, soundLevel: 0));
        }
      },
      onError: (e) => print('Error speech:____________________ $e'),
    );
  }

  /// Starts or stops the speech recognition service.
  Future<void> toggleRecording(String? localeId) async {
    if (!speechToText.isAvailable) return;
    print('CAME HERE_______________________1');
    if (speechToText.isListening) {
      print('CAME HERE_______________________2');
      speechToText.stop();
      emit(state.copyWith(isRecording: false, soundLevel: 0));
    } else {
      print('CAME HERE_______________________3');
      emit(state.copyWith(isRecording: true));
      startSpeechListening(localeId);
    }
  }

  Future<void> startSpeechListening(String? localeId) async {
    String recognizedText = '${textController.text}\n';
    print('CAME HERE_______________________4${speechToText.hasPermission}');
    print('CAME HERE_______________________4${speechToText.hasError}');
    print('CAME HERE_______________________4${speechToText.isAvailable}');
    speechToText.listen(
      localeId: localeId,
      onDevice: false,
      onSoundLevelChange: (double level) {
        print('CAME HERE_______________________5');
        emit(state.copyWith(soundLevel: level));
      },
      onResult: (value) {
        print('RESULT__________startSpeechListening_____$value');
        textController.text = recognizedText + value.recognizedWords;
        textController.selection = TextSelection.fromPosition(
          TextPosition(
            offset: textController.text.length,
          ),
        );
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
    print('CAME HERE_______________________6');
  }

  /// Cancels the speech recognition service.
  /// Submit the text depending on the [speechToTextScreenMode].
  void onNextTap() {
    if (textController.text.isEmpty) {
      NavigationService.showErrorToast('strEmpty'.tr());
      return;
    }
    speechToText.cancel();

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
      emit(state.copyWith(status: Status.loading));

      if (reportBloc.reportType == ReportType.accident) {
        await accidentRepository.accidentWitnesses(
            reportBloc.reportId, textController.text);
      } else {
        await breakdownRepository.breakdownWitnesses(
            reportBloc.reportId, textController.text);
      }

      NavigationService.pushNamed(
        routeName: PointsOfImpactScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );

      emit(state.copyWith(status: Status.initial));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void _onVisibleDamageSubmitted() async {
    try {
      emit(state.copyWith(status: Status.loading));

      await _sendVisibleDamage();

      emit(state.copyWith(status: Status.initial));

      if (reportBloc.reportType == ReportType.accident) {
        NavigationService.pushNamed(
          routeName: SpeechToTextScreen.route,
          nestedKey: NavigationService.homeNavigatorKey,
          arguments: SpeechToTextArgs(
            mode: SpeechToTextScreenMode.remarks,
            step: 6,
          ),
        );
      } else {
        NavigationService.pushNamed(
          routeName: CircumstancesScreen.route,
          nestedKey: NavigationService.homeNavigatorKey,
        );
      }
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> _sendVisibleDamage() async {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
        await accidentRepository.visibleDamage(
            reportBloc.reportId, textController.text);
      } else {
        await accidentRepository.visibleDamageB(
            reportBloc.reportId, textController.text);
      }
    } else {
      await breakdownRepository.visibleDamage(
          reportBloc.reportId, textController.text);
    }
  }

  void _onRemarksSubmitted() async {
    try {
      emit(state.copyWith(status: Status.loading));

      await _sendRemarks();

      final VehicleType vehicleType;

      if (reportBloc.state.user == User.A ||
          reportBloc.reportType == ReportType.breakdown) {
        vehicleType = reportBloc.aDriverVehicleType;
      } else {
        vehicleType = await accidentRepository
            .getSecondDriverVehicleType(reportBloc.reportId);
      }

      emit(state.copyWith(status: Status.initial));

      NavigationService.pushNamed(
        routeName: DamagedPartsScreen.route,
        arguments: DamagedPartsScreenArgs(vehicleType: vehicleType),
        nestedKey: NavigationService.homeNavigatorKey,
      );

      emit(state.copyWith(status: Status.initial));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  /// Returns the current step to be displayed in the [StepIndicator].
  int getStep() {
    if (speechToTextScreenMode == SpeechToTextScreenMode.witnesses) {
      return 3;
    }
    if (speechToTextScreenMode == SpeechToTextScreenMode.visibleDamage) {
      if (reportBloc.state.user == User.A) {
        return 5;
      } else {
        return 10;
      }
    } else {
      if (reportBloc.reportType == ReportType.accident) {
        if (reportBloc.state.user == User.A) {
          return 6;
        } else {
          return 11;
        }
      } else {
        return 7;
      }
    }
  }

  Future<void> _sendRemarks() async {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
        await accidentRepository.myRemarks(
            reportBloc.reportId, textController.text);
      } else {
        await accidentRepository.myRemarksB(
            reportBloc.reportId, textController.text);
      }
    } else {
      await breakdownRepository.myRemarks(
          reportBloc.reportId, textController.text);
    }
  }
}
