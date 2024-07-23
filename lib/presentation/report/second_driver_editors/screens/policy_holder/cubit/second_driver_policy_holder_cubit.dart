// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/string_helper.dart';

import '../../insurance_company/insurance_company_screen.dart';

part 'second_driver_policy_holder_state.dart';

part 'second_driver_policy_holder_cubit.freezed.dart';

class SecondDriverPolicyHolderCubit
    extends Cubit<SecondDriverPolicyHolderState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneEmailController = TextEditingController();

  bool sameAsDriver = false;

  SecondDriverPolicyHolderCubit({
    required this.reportBloc,
    required this.accidentRepository,
  }) : super(const SecondDriverPolicyHolderState());

  //

  bool validateForm() => formKey.currentState!.validate();

  makeSameAsDriver(bool val) async {
    sameAsDriver = val;
    if (val) {
      final res = await accidentRepository.sameAsDriver(
        accidentId: reportBloc.reportId,
        sameAsDriver: val,
      );
      firstNameController.text = res?.firstName ?? '';
      lastNameController.text = res?.lastName ?? '';
      countryController.text = res?.country ?? '';
      cityController.text = res?.city ?? '';
      stateController.text = res?.state ?? '';
      streetController.text = res?.street ?? '';
      postalCodeController.text = res?.postalCode ?? '';
      phoneEmailController.text = res?.phoneNumber ?? '';
    } else {
      firstNameController.clear();
      lastNameController.clear();
      countryController.clear();
      cityController.clear();
      stateController.clear();
      streetController.clear();
      postalCodeController.clear();
      phoneEmailController.clear();
    }
  }

  void onSubmit() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final policyHolderB = PolicyHolderRequestModel(
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

      await accidentRepository.updatePolicyHolderB(
        reportBloc.reportId,
        policyHolderB,
      );
      emit(state.copyWith(status: Status.success));
      NavigationService.pushNamed(
        routeName: SecondDriverEditorInsuranceScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
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
      if (emailRegex.hasMatch(phoneEmailController.text)) {
        return phoneEmailController.text;
      } else {
        return null;
      }
    } else {
      if (phoneRegex.hasMatch(phoneEmailController.text)) {
        return phoneEmailController.text;
      } else {
        return null;
      }
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
