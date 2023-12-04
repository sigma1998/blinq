// Package imports:
import 'dart:async';

import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'second_driver_bloc.freezed.dart';

part 'second_driver_state.dart';

class SecondDriverBloc extends Cubit<SecondDriverState> {
  //
  final AccidentRepository repository;
  final ReportBloc reportBloc;

  SecondDriverBloc({required this.repository, required this.reportBloc})
      : super(const SecondDriverState());

  FutureOr<void> onFetchSecondDriver(int id) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final data = await repository.fetchUserById(id);
      emit(state.copyWith(secondDriver: data, status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void onNextPressed() async {
    emit(state.copyWith(status: Status.loading));

    try {
      await repository.addDriverB(
          accidentId: reportBloc.reportId,
          secondDriverId: state.secondDriver!.id!);

      reportBloc.setUser(User.B);

      emit(state.copyWith(status: Status.initial));

      NavigationService.pushNamed(
          routeName: PointsOfImpactScreen.route,
          nestedKey: NavigationService.homeNavigatorKey);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<bool> onScreenPop() async{
    reportBloc.setUser(User.A);
    return true;
  }



  void onBack() {
    reportBloc.setUser(User.A);
    NavigationService.homeNavigatorKey.currentState?.pop();
  }
}
