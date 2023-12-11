// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/presentation/report/pages/injury/cubit/injury_screen_state.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/data/model/accident/injury/injury.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';

class InjuryScreenCubit extends Cubit<InjuryScreenState> {
  //
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  InjuryScreenCubit({
    required this.reportBloc,
    required this.accidentRepository,
  }) : super(const InjuryScreenState());

  //
  void onAnyInjuriesChanged(bool? value) =>
      emit(state.copyWith(anyInjuries: value));

  void onDamagedVehiclesChanged(bool? value) =>
      emit(state.copyWith(damagedVehicles: value));

  void onDamageBesideVehicleChanged(bool? value) =>
      emit(state.copyWith(damageBesideVehicle: value));

  bool get isNextEnabled =>
      state.anyInjuries != null &&
      state.damagedVehicles != null &&
      state.damageBesideVehicle != null;

  //

  Future<void> onNext() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await accidentRepository.accidentInjury(
        reportBloc.reportId,
        InjuryDto(
          injury: state.anyInjuries!,
          otherDamagedVehicles: state.damagedVehicles!,
          otherDamagedItems: state.damageBesideVehicle!,
        ),
      );
      reportBloc.setProgress(reportBloc.progress + 1);
      emit(state.copyWith(status: Status.initial));

      NavigationService.pushNamed(
          routeName: SpeechToTextScreen.route,
          arguments: SpeechToTextArgs(mode: SpeechToTextScreenMode.witnesses),
          nestedKey: NavigationService.homeNavigatorKey);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
