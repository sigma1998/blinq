import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'points_of_impact_state.dart';

class PointsOfImpactBloc extends Cubit<PointsOfImpactScreenState> {
  PointsOfImpactBloc() : super(const PointsOfImpactScreenState());

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

  void onNextPressed() {
    NavigationService.pushNamed(
        routeName: SpeechToTextScreen.route,
        arguments: SpeechToTextArgs(mode: SpeechToTextScreenMode.visibleDamage),
        nestedKey: NavigationService.homeNavigatorKey);
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
