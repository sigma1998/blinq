// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/presentation/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'insurance_editor_event.dart';

part 'insurance_editor_state.dart';
part 'insurance_editor_bloc.freezed.dart';

class InsuranceEditorBloc
    extends Bloc<InsuranceEditorEvent, InsuranceEditorState> {
  //
  final ProfileRepository repository;

  final nameController = TextEditingController();
  final policyNumberController = TextEditingController();
  final greenCardNumberController = TextEditingController();
  final certificateValidFromController = TextEditingController();
  final certificateValidToController = TextEditingController();
  final agencyController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final policyCoverController = TextEditingController();

  InsuranceEditorBloc({required this.repository})
      : super(const InsuranceEditorState()) {
    on<OnSubmitInsurance>(_onSubmitDriver);
  }

  FutureOr<void> _onSubmitDriver(
      OnSubmitInsurance event, Emitter<InsuranceEditorState> emit) async {
    try {
      final insurance = InsuranceRequestModel(
        name: nameController.text,
        policyNumber: policyCoverController.text,
        greenCardNumber: greenCardNumberController.text,
        certificateValidFrom: certificateValidFromController.text,
        certificateValidTo: certificateValidToController.text,
        agency: agencyController.text,
        country: countryController.text,
        address: addressController.text,
        email: emailController.text,
        policyCover: policyCoverController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await repository.updateInsurance(insurance);
      emit(const InsuranceEditorState(status: Status.success));
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void onSelectCountriesPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryController.text = value;
      }
    });
  }
}
