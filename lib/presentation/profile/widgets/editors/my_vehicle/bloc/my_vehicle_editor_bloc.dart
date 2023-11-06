// Dart imports:
import 'dart:async';

// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/my_vehicle/request/my_vehicle_request_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'my_vehicle_editor_event.dart';

part 'my_vehicle_editor_state.dart';
part 'my_vehicle_editor_bloc.freezed.dart';

class MyVehicleEditorBloc
    extends Bloc<MyVehicleEditorEvent, MyVehicleEditorState> {
  //
  final ProfileRepository repository;

  final traveledKmController = TextEditingController();
  final nextTechnicalController = TextEditingController();
  final oilReplacementController = TextEditingController();
  final batteryReplacementDateController = TextEditingController();

  MyVehicleEditorBloc({required this.repository})
      : super(const MyVehicleEditorState()) {
    on<OnSubmitMyVehicle>(_onSubmitMyVehicle);
  }

  FutureOr<void> _onSubmitMyVehicle(
      OnSubmitMyVehicle event, Emitter<MyVehicleEditorState> emit) async {
    try {
      final myVehicle = MyVehicleRequestModel(
        traveledKm: traveledKmController.text,
        nextTechnical: nextTechnicalController.text,
        oilReplacement: oilReplacementController.text,
        batteryReplacementDate: batteryReplacementDateController.text,
      );

      emit(const MyVehicleEditorState(status: Status.loading));
      await repository.updateMyVehicle(myVehicle);
      emit(const MyVehicleEditorState(status: Status.success));
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
