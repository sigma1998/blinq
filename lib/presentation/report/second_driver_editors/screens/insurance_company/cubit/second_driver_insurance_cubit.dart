// Flutter imports:
import 'package:blinq/utils/string_helper.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/second_driver_editors/screens/driver/driver_screen.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/data/model/insurance/request/insurance_request_model.dart';
import 'package:blinq/utils/custom_widgets/dialogs/cupertino_dialog.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

part 'second_driver_insurance_state.dart';
part 'second_driver_insurance_cubit.freezed.dart';

class SecondDriverInsuranceCubit extends Cubit<SecondDriverInsuranceState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final policyNumberController = TextEditingController();
  final greenCardNumberController = TextEditingController();
  final certificateValidFromController = TextEditingController();
  final certificateValidToController = TextEditingController();
  final agencyController = TextEditingController();
  final countryController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final policyCoverController = TextEditingController();

  SecondDriverInsuranceCubit({
    required this.reportBloc,
    required this.accidentRepository,
  }) : super(const SecondDriverInsuranceState());

  //

  bool validateForm() => formKey.currentState!.validate();

  //

  void onSubmit() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final insuranceB = InsuranceRequestModel(
        name: nameController.text,
        policyNumber: policyNumberController.text,
        greenCardNumber: greenCardNumberController.text,
        certificateValidFrom: certificateValidFromController.text,
        certificateValidTo: certificateValidToController.text,
        agency: agencyController.text,
        country: countryController.text,
        address: addressController.text,
        phoneNumber:
            MyStringHelper.removeNonNumbers(phoneNumberController.text),
        email: emailController.text,
        policyCover: policyCoverController.text.toLowerCase(),
      );

      await accidentRepository.updateInsuranceCompanyB(
        reportBloc.reportId,
        insuranceB,
      );
      emit(state.copyWith(status: Status.success));
      NavigationService.pushNamed(
        routeName: SecondDriverEditorScreen.route,
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

  void onPolicyCoverPressed() {
    NavigationService.showDialog(
            dialog: MyCupertinoDialog(title: 'strPolicCover'.tr()))!
        .then((value) {
      if (value != null) {
        policyCoverController.text = value;
      }
    });
  }
}
