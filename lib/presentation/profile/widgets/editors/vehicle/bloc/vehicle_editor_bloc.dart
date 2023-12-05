// Dart imports:
import 'dart:async';

import 'package:blinq/data/model/car/request/car_request_model.dart';

// Flutter imports:
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/vehicle_type_dialog/vehicle_type_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'vehicle_editor_event.dart';

part 'vehicle_editor_bloc.freezed.dart';

part 'vehicle_editor_state.dart';

class VehicleEditorBloc extends Bloc<VehicleEditorEvent, VehicleEditorState> {
  //
  final ProfileBloc profileBloc;

  final ProfileRepository repository;

  final makeTypeController = TextEditingController();
  final engineNumberController = TextEditingController();
  final countryOfRegistrationController = TextEditingController();
  final vehicleTypeController = TextEditingController();
  final trailerRegistrationNumberController = TextEditingController();
  final trailerCountryOfRegistrationController = TextEditingController();

  VehicleEditorBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(const VehicleEditorState()) {
    on<OnSubmitVehicle>(_onSubmitVehicle);
  }

  void initializeFields() {
    makeTypeController.text = profileBloc.state.profile?.car?.makeType ?? '';
    engineNumberController.text =
        profileBloc.state.profile?.car?.engineNumber ?? '';
    countryOfRegistrationController.text =
        profileBloc.state.profile?.car?.countryOfRegistration ?? '';
    trailerRegistrationNumberController.text =
        profileBloc.state.profile?.car?.trailerRegistrationNumber ?? '';
    trailerCountryOfRegistrationController.text =
        profileBloc.state.profile?.car?.trailerCountryOfRegistration ?? '';
    vehicleTypeController.text =
        profileBloc.state.profile?.car?.vehicleType?.name ?? '';
  }

  FutureOr<void> _onSubmitVehicle(
      OnSubmitVehicle event, Emitter<VehicleEditorState> emit) async {
    try {
      final vehicle = CarRequestModel(
        // carId: ,
        // colorId: ,
        makeType: makeTypeController.text,
        engineNumber: engineNumberController.text,
        countryOfRegistration: countryOfRegistrationController.text,
        trailerRegistrationNumber: trailerRegistrationNumberController.text,
        trailerCountryOfRegistration:
            trailerCountryOfRegistrationController.text,
        vehicleType: VehicleType.values
            .firstWhere((type) => type.name == vehicleTypeController.text),
      );

      emit(const VehicleEditorState(status: Status.loading));
      await repository.updateCar(vehicle);
      emit(const VehicleEditorState(status: Status.success));
      profileBloc.add(OnFetchProfile());
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void onSelectCountryOfRegistrationPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryOfRegistrationController.text = value;
      }
    });
  }

  void onVehicleTypePressed() {
    NavigationService.showDialog(dialog: const VehicleTypeDialog())!
        .then((type) {
      if (type != null) {
        vehicleTypeController.text = type ?? '';
      }
    });
  }

  void onSelectTrailerCountryOfRegistrationPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        trailerCountryOfRegistrationController.text = value;
      }
    });
  }
}
