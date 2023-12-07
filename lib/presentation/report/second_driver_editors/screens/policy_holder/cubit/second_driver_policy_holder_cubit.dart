// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/second_driver_editors/screens/car/car_screen.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/data/model/policy_holder/request/policy_holder_request_model.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/string_helper.dart';

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
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  SecondDriverPolicyHolderCubit({
    required this.reportBloc,
    required this.accidentRepository,
  }) : super(const SecondDriverPolicyHolderState());

  //

  bool validateForm() => formKey.currentState!.validate();

  //

  void onSubmit() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final policyHolderB = PolicyHolderRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        address: addressController.text,
        postalCode: postalCodeController.text,
        country: countryController.text,
        phoneNumber:
            MyStringHelper.removeNonNumbers(phoneNumberController.text),
        email: emailController.text,
      );

      await accidentRepository.updatePolicyHolderB(
        reportBloc.reportId,
        policyHolderB,
      );
      emit(state.copyWith(status: Status.success));
      NavigationService.pushNamed(
        routeName: SecondDriverEditorCarScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
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
