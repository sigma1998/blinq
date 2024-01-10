// Dart imports:
import 'dart:async';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/notification/notification_service.dart';

part 'second_driver_cubit.freezed.dart';

part 'second_driver_state.dart';

class SecondDriverCubit extends Cubit<SecondDriverState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository repository;

  SecondDriverCubit({
    required this.repository,
    required this.reportBloc,
  }) : super(const SecondDriverState());

  //
  void onValueChanged(bool? value) =>
      emit(state.copyWith(isSecondDriverBlinq: value));

  bool get isNextEnabled => state.isSecondDriverBlinq != null;

  //

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
    if (!state.isSecondDriverBlinq!) {
      onBack();
    }

    emit(state.copyWith(status: Status.loading));

    await repository.sendNotificationToUserB(
        accidentId: reportBloc.reportId, userId: state.secondDriver!.id!);

    _listenNotification();
  }

  Future<bool> onScreenPop() async {
    reportBloc.setUser(User.A);
    return true;
  }

  void onBack() {
    reportBloc.setUser(User.A);
    NavigationService.homeNavigatorKey.currentState?.pop();
  }

  void _listenNotification() {
    NotificationService.responseNotificationStream.listen((event) {
      if (event != null) {
        if (event.answer != 'yes') {
          NavigationService.showErrorToast('strUserBDidNotConfirm'.tr());
          onBack();
        } else {
          _addUserB();
        }
      }
    });
  }

  Future<void> _addUserB() async {
    try {
      await repository.addDriverB(
        accidentId: reportBloc.reportId,
        secondDriverId: state.secondDriver!.id!,
      );

      reportBloc.setUser(User.B);

      emit(state.copyWith(status: Status.initial));

      NavigationService.pushNamed(
        routeName: PointsOfImpactScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
