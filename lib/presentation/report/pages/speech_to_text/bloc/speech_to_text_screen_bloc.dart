import 'package:blinq/presentation/report/pages/circumstances/circumstances_screen.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'speech_to_text_screen_mode.dart';

class SpeechToTextScreenBloc extends Cubit<GenericBlocState> {
  late final SpeechToTextScreenMode speechToTextScreenMode;

  late final String title;

  SpeechToTextScreenBloc({required this.speechToTextScreenMode})
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

  void _onVisibleDamageSubmitted() {
    NavigationService.pushNamed(
      routeName: CircumstancesScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }

  void _onWitnessesSubmitted() {
    NavigationService.pushNamed(
      routeName: PointsOfImpactScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }

  void _onRemarksSubmitted() {}
}
