// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'policy_holder_editor_event.dart';

part 'policy_holder_editor_state.dart';

part 'policy_holder_editor_bloc.freezed.dart';

class PolicyHolderEditorBloc
    extends Bloc<PolicyHolderEditorEvent, PolicyHolderEditorState> {
  //
  final ProfileBloc profileBloc;
  final ProfileRepository repository;

  final formKey = GlobalKey<FormState>();
  bool sameAsDriver = false;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final emailController = TextEditingController();

  PolicyHolderEditorBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(const PolicyHolderEditorState()) {
    on<OnSubmitPolicyHolder>(_onSubmitPolicyHolder);
  }

  void initializeFields() {
    firstNameController.text =
        profileBloc.state.profile?.policyHolder?.firstName ?? '';
    lastNameController.text =
        profileBloc.state.profile?.policyHolder?.lastName ?? '';
    countryController.text =
        profileBloc.state.profile?.policyHolder?.country ?? '';
    cityController.text = profileBloc.state.profile?.policyHolder?.city ?? '';
    stateController.text = profileBloc.state.profile?.policyHolder?.state ?? '';
    streetController.text =
        profileBloc.state.profile?.policyHolder?.street ?? '';
    postalCodeController.text =
        profileBloc.state.profile?.policyHolder?.postalCode ?? '';
    emailController.text =
        profileBloc.state.profile?.policyHolder?.phoneEmail ??
            profileBloc.state.profile?.policyHolder?.phoneNumber ??
            profileBloc.state.profile?.policyHolder?.email ??
            '';
  }

  bool validateForm() => formKey.currentState!.validate();

  makeSameAsDriver(bool val) async {
    sameAsDriver = val;
    if (val) {
      firstNameController.text = profileBloc.state.profile?.firstName ?? '';
      lastNameController.text = profileBloc.state.profile?.lastName ?? '';
      countryController.text = profileBloc.state.profile?.country ?? '';
      cityController.text = profileBloc.state.profile?.city ?? '';
      stateController.text = profileBloc.state.profile?.state ?? '';
      streetController.text = profileBloc.state.profile?.street ?? '';
      postalCodeController.text = profileBloc.state.profile?.postalCode ?? '';
      emailController.text = profileBloc.state.profile?.phoneNumber ??
          profileBloc.state.profile?.email ??
          '';
    } else {
      firstNameController.clear();
      lastNameController.clear();
      countryController.clear();
      cityController.clear();
      stateController.clear();
      streetController.clear();
      postalCodeController.clear();
      emailController.clear();
    }
  }

  //

  void onSelectCountriesPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryController.text = value;
      }
    });
  }

  //

  FutureOr<void> _onSubmitPolicyHolder(
      OnSubmitPolicyHolder event, Emitter<PolicyHolderEditorState> emit) async {
    try {
      final policyHolder = PolicyHolderRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        country: countryController.text,
        city: cityController.text,
        state: stateController.text,
        street: streetController.text,
        postalCode: postalCodeController.text,
        email: isEmail(isEmail: true, isPhone: false),
        phoneNumber: isEmail(isEmail: false, isPhone: true),
        sameAsDriver: sameAsDriver,
      );

      emit(const PolicyHolderEditorState(status: Status.loading));
      await repository.updatePolicyHolder(policyHolder);
      emit(const PolicyHolderEditorState(status: Status.success));
      profileBloc.add(OnFetchProfile());
      NavigationService.back(result: true);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  String? isEmail({bool isEmail = true, bool isPhone = false}) {
    // Regular expressions for phone number and email validation
    RegExp phoneRegex = RegExp(r'^\d{10}$'); // Matches 10 digits
    RegExp emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Matches valid email format

    // Check if input matches either phone number or email format
    if (isEmail) {
      if (emailRegex.hasMatch(emailController.text)) {
        return emailController.text;
      } else {
        return null;
      }
    } else {
      if (phoneRegex.hasMatch(emailController.text)) {
        return emailController.text;
      } else {
        return null;
      }
    }
  }
}
