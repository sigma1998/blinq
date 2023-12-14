import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/sign/sign_screen.dart';
import 'package:blinq/presentation/report/pages/sketch/sketch_screen.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'circumstance_state.dart';

class CircumstancesBloc extends Cubit<CircumstanceState> {
  final ReportBloc reportBloc;
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;

  late final bool isAccident;

  CircumstancesBloc(
      {required this.accidentRepository,
      required this.breakdownRepository,
      required this.reportBloc})
      : super(const CircumstanceState()) {
    isAccident = reportBloc.reportType == ReportType.accident;
  }

  driverAActive(int index) {
    return state.driverA.contains(Circumstances.values[index].key);
  }

  driverBActive(int index) {
    return state.driverB.contains(Circumstances.values[index].key);
  }

  onCheckedA(int index) {
    if (state.driverA.contains(Circumstances.values[index].key)) {
      Set<String> set = {};
      set.addAll(state.driverA);
      set.remove(Circumstances.values[index].key);
      emit(state.copyWith(driverA: set));
    } else {
      Set<String> set = {};
      set.addAll(state.driverA);
      set.add(Circumstances.values[index].key);
      emit(state.copyWith(driverA: set));
    }
  }

  onCheckedB(int index) {
    if (state.driverB.contains(Circumstances.values[index].key)) {
      Set<String> set = {};
      set.addAll(state.driverB);
      set.remove(Circumstances.values[index].key);
      emit(state.copyWith(driverB: set));
    } else {
      Set<String> set = {};
      set.addAll(state.driverB);
      set.add(Circumstances.values[index].key);
      emit(state.copyWith(driverB: set));
    }
  }

  Future<void> onSubmit() async {
    emit(state.copyWith(status: Status.loading));

    try {
      if (reportBloc.reportType == ReportType.accident) {
        await accidentRepository.sendCircumstances(
            accidentId: reportBloc.reportId,
            a: state.driverA.toList(),
            b: state.driverB.toList());
      } else {
        await breakdownRepository.sendCircumstances(
          breakdownId: reportBloc.reportId,
          list: state.driverB.toList(),
        );
      }

      emit(state.copyWith(status: Status.initial));

      final bool? res =
          await NavigationService.pushNamed(routeName: SketchScreen.route);
      if (res ?? false) {
        if (reportBloc.reportType == ReportType.accident) {
          NavigationService.pushNamed(
              routeName: SignScreen.route,
              nestedKey: NavigationService.homeNavigatorKey);
        } else {
          NavigationService.pushNamed(
            routeName: SpeechToTextScreen.route,
            nestedKey: NavigationService.homeNavigatorKey,
            arguments: SpeechToTextArgs(mode: SpeechToTextScreenMode.remarks),
          );
        }
      }
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  int getStep() {
    if(reportBloc.reportType == ReportType.accident){
      return 15;
    }
    return 6;
  }
}

enum Circumstances {
  parkedStopped(
    title: 'parked/stopped',
    key: 'parked_stopperd',
  ),
  leavingPlace(
    title: 'leaving a parking place/ opening the door',
    key: 'leaving_place',
  ),
  enteringPlace(
    title: 'entering a parking place',
    key: 'entering_place',
  ),
  emergingFrom(
    title: 'emerging from a car park, from private ground, from a track',
    key: 'emerging_from',
  ),
  enteringPark(
    title: 'entering a car park, private ground, a track',
    key: 'entering_park',
  ),
  enteringCirculation(
    title: 'entering a roundabout',
    key: 'entering_roundabout',
  ),
  circulatingRoundabout(
    title: 'circulating a roundabout',
    key: 'circulating_roundabout',
  ),
  strikingRear(
    title: 'striking the rear of the other vehicle while'
        ' going in the same direction and in the same lane',
    key: 'striking_rear',
  ),
  sameDirection(
    title: 'going in the same direction but in a different lane',
    key: 'same_direction',
  ),
  changingLanes(
    title: 'changing lanes',
    key: 'changing_lanes',
  ),
  overtaking(
    title: 'overtaking turning to the right turning to the left reversing',
    key: 'overtaking',
  ),
  turningRight(
    title: 'turning to the right turning to the left reversing',
    key: 'turning_right',
  ),
  turningLeft(
    title: 'turning to the left',
    key: 'turning_left',
  ),
  reversing(
    title: 'reversing',
    key: 'reversing',
  ),
  encroaching(
    title: 'encroaching on a lane reserved for '
        'circulation in the opposite direction',
    key: 'encroaching',
  ),
  comingRight(
    title: 'coming from the right (at road junctions)',
    key: 'coming_right',
  ),
  notObserved(
    title: 'had not observed a right of way sign or a red light',
    key: 'not_observed',
  );

  const Circumstances({
    required this.title,
    required this.key,
  });

  final String title;
  final String key;
}
