// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/utils/custom_widgets/dialogs/cupertino_dialog.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'insurance_editor_event.dart';

part 'insurance_editor_state.dart';
part 'insurance_editor_bloc.freezed.dart';

class InsuranceEditorBloc
    extends Bloc<InsuranceEditorEvent, InsuranceEditorState> {
  //
  final ProfileBloc profileBloc;
  final ProfileRepository repository;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final policyNumberController = TextEditingController();
  final greenCardNumberController = TextEditingController();
  final certificateValidFromController = TextEditingController();
  final certificateValidToController = TextEditingController();
  final agencyController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final zipController = TextEditingController();
  final emailController = TextEditingController();
  final policyCoverController = TextEditingController();

  InsuranceEditorBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(const InsuranceEditorState()) {
    on<OnSubmitInsurance>(_onSubmitDriver);
  }

  void initializeFields() {
    nameController.text = profileBloc.state.profile?.insurance?.name ?? '';
    policyNumberController.text =
        profileBloc.state.profile?.insurance?.policyNumber ?? '';
    greenCardNumberController.text =
        profileBloc.state.profile?.insurance?.greenCardNumber ?? '';
    certificateValidFromController.text =
        profileBloc.state.profile?.insurance?.certificateValidFrom ?? '';
    certificateValidToController.text =
        profileBloc.state.profile?.insurance?.certificateValidTo ?? '';
    agencyController.text = profileBloc.state.profile?.insurance?.agency ?? '';
    countryController.text =
        profileBloc.state.profile?.insurance?.country ?? '';
    cityController.text =
        profileBloc.state.profile?.insurance?.city ?? '';
    stateController.text =
        profileBloc.state.profile?.insurance?.state ?? '';
    streetController.text =
        profileBloc.state.profile?.insurance?.street ?? '';
    zipController.text =
        profileBloc.state.profile?.insurance?.postalCode ?? '';
    emailController.text = profileBloc.state.profile?.insurance?.email ?? '';
    policyCoverController.text =
        profileBloc.state.profile?.insurance?.policyCover ?? '';
  }

  bool validateForm() => formKey.currentState!.validate();

  //

  void onSelectCountriesPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryController.text = value;
      }
    });
  }

  void onPolicyCoverPressed() {
    NavigationService.showDialog(
            dialog: MyCupertinoDialog(title: 'strPolicCover'.tr()))!
        .then((value) {
      if (value != null) {
        policyCoverController.text = value;
      }
    });
  }

  //

  FutureOr<void> _onSubmitDriver(
      OnSubmitInsurance event, Emitter<InsuranceEditorState> emit) async {
    try {
      final insurance = InsuranceRequestModel(
        name: nameController.text,
        policyNumber: policyNumberController.text,
        greenCardNumber: greenCardNumberController.text,
        certificateValidFrom: certificateValidFromController.text,
        certificateValidTo: certificateValidToController.text,
        agency: agencyController.text,
        country: countryController.text,
        city: cityController.text,
        state: stateController.text,
        street: streetController.text,
        postalCode: zipController.text,
        email: emailController.text,
        policyCover: policyCoverController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await repository.updateInsurance(insurance);
      emit(const InsuranceEditorState(status: Status.success));
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
