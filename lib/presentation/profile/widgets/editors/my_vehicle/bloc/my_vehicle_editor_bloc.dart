// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/vehicle/request/vehicle_request_model.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'my_vehicle_editor_event.dart';

part 'my_vehicle_editor_state.dart';
part 'my_vehicle_editor_bloc.freezed.dart';

class MyVehicleEditorBloc
    extends Bloc<MyVehicleEditorEvent, MyVehicleEditorState> {
  //
  final ProfileBloc profileBloc;
  final ProfileRepository repository;

  final traveledKmController = TextEditingController();
  final nextTechnicalController = TextEditingController();
  final oilReplacementController = TextEditingController();
  final batteryReplacementDateController = TextEditingController();

  MyVehicleEditorBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(const MyVehicleEditorState()) {
    on<OnSubmitMyVehicle>(_onSubmitMyVehicle);
  }

  void initializeFields() {
    traveledKmController.text =
        profileBloc.state.profile?.userVehicle?.traveledKm.toString() ?? '';
    nextTechnicalController.text =
        profileBloc.state.profile?.userVehicle?.nextTechnical.toString() ?? '';
    oilReplacementController.text =
        profileBloc.state.profile?.userVehicle?.oilReplacement.toString() ?? '';
    batteryReplacementDateController.text =
        profileBloc.state.profile?.userVehicle?.batteryReplacementDate ?? '';
  }

  FutureOr<void> _onSubmitMyVehicle(
      OnSubmitMyVehicle event, Emitter<MyVehicleEditorState> emit) async {
    try {
      final userVehicle = UserVehicleRequestModel(
        traveledKm: traveledKmController.text,
        nextTechnical: nextTechnicalController.text,
        oilReplacement: oilReplacementController.text,
        batteryReplacementDate: batteryReplacementDateController.text,
      );

      emit(const MyVehicleEditorState(status: Status.loading));
      await repository.updateUserVehicle(userVehicle);
      emit(const MyVehicleEditorState(status: Status.success));
      profileBloc.add(OnFetchProfile());
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
