// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/data/model/car/request/car_request_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'vehicle_editor_event.dart';

part 'vehicle_editor_state.dart';
part 'vehicle_editor_bloc.freezed.dart';

class VehicleEditorBloc extends Bloc<VehicleEditorEvent, VehicleEditorState> {
  //
  final ProfileBloc profileBloc;

  final ProfileRepository repository;

  final makeTypeController = TextEditingController();
  final engineNumberController = TextEditingController();
  final countryOfRegistrationController = TextEditingController();
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

  void onSelectTrailerCountryOfRegistrationPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        trailerCountryOfRegistrationController.text = value;
      }
    });
  }
}
