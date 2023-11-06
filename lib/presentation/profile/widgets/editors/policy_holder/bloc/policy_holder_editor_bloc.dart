// Flutter imports:
import 'dart:async';

import 'package:blinq/presentation/countries_dialog/countries_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'policy_holder_editor_event.dart';

part 'policy_holder_editor_state.dart';
part 'policy_holder_editor_bloc.freezed.dart';

class PolicyHolderEditorBloc
    extends Bloc<PolicyHolderEditorEvent, PolicyHolderEditorState> {
  //
  final ProfileRepository repository;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();

  PolicyHolderEditorBloc({required this.repository})
      : super(const PolicyHolderEditorState()) {
    on<OnSubmitPolicyHolder>(_onSubmitPolicyHolder);
  }

  FutureOr<void> _onSubmitPolicyHolder(
      OnSubmitPolicyHolder event, Emitter<PolicyHolderEditorState> emit) async {
    try {
      final policyHolder = PolicyHolderRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        address: addressController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
        phoneNumber: phoneNumberController.text,
      );

      emit(const PolicyHolderEditorState(status: Status.loading));
      await repository.updatePolicyHolder(policyHolder);
      emit(const PolicyHolderEditorState(status: Status.success));
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
