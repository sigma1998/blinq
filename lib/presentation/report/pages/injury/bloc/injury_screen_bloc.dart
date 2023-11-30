import 'package:blinq/data/model/accident/injury/injury.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/injury/bloc/injury_screen_state.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InjuryScreenBloc extends Cubit<InjuryScreenState> {
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  bool anyInjuries = false;
  bool damagedVehicles = false;
  bool damageBesideVehicle = false;

  InjuryScreenBloc({required this.reportBloc, required this.accidentRepository})
      : super(const InjuryScreenState());

  Future<void> onNext() async {
    emit(state.copyWith(status: Status.loading));
    try {
      await accidentRepository.accidentInjury(
          reportBloc.accidentId,
          InjuryDto(
              injury: anyInjuries,
              otherDamagedVehicles: damagedVehicles,
              otherDamagedItems: damageBesideVehicle));
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
