import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/screenshot_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'points_of_impact_state.dart';

class PointsOfImpactBloc extends Cubit<PointsOfImpactScreenState> {
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  final GlobalKey key = GlobalKey();

  PointsOfImpactBloc(
      {required this.reportBloc, required this.accidentRepository})
      : super(const PointsOfImpactScreenState());

  void onArrowPressed({required PointOfImpact pointOfImpact}) {
    switch (pointOfImpact) {
      case PointOfImpact.bottom:
        emit(state.copyWith(isBottomActive: !state.isBottomActive));
      case PointOfImpact.bottomRight:
        emit(state.copyWith(isBottomRightActive: !state.isBottomRightActive));
      case PointOfImpact.bottomLeft:
        emit(state.copyWith(isBottomLeftActive: !state.isBottomLeftActive));
      case PointOfImpact.left:
        emit(state.copyWith(isLeftActive: !state.isLeftActive));
      case PointOfImpact.right:
        emit(state.copyWith(isRightActive: !state.isRightActive));
      case PointOfImpact.top:
        emit(state.copyWith(isTopActive: !state.isTopActive));
      case PointOfImpact.topRight:
        emit(state.copyWith(isTopRightActive: !state.isTopRightActive));
      case PointOfImpact.topLeft:
        emit(state.copyWith(isTopLeftActive: !state.isTopLeftActive));
    }
  }

  void onNextPressed(BuildContext context) async {
    emit(state.copyWith(
      status: Status.loading,
    ));

    try {
      final file = await captureSocialPng(key, context);

      if (file == null) {
        return;
      }

      final multipartFile = MultipartFile.fromBytes(
        file.readAsBytesSync(),
        filename: file.path.split('/').last,
      );

      await accidentRepository.accidentInitialImpactPoint(
          reportBloc.reportId, multipartFile);
      emit(state.copyWith(
        status: Status.initial,
      ));
      NavigationService.pushNamed(
          routeName: SpeechToTextScreen.route,
          arguments:
              SpeechToTextArgs(mode: SpeechToTextScreenMode.visibleDamage),
          nestedKey: NavigationService.homeNavigatorKey);
    } catch (e) {
      emit(state.copyWith(
        status: Status.initial,
      ));
    }
  }
}

enum PointOfImpact {
  top,
  topRight,
  topLeft,
  left,
  right,
  bottom,
  bottomLeft,
  bottomRight
}
