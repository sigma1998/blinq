// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/license_category_dialog/license_category_dialog.dart';
import 'package:blinq/utils/string_helper.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

part 'second_driver_state.dart';
part 'second_driver_cubit.freezed.dart';

class SecondDriverCubit extends Cubit<SecondDriverState> {
  //
  final ReportBloc reportBloc;

  final AccidentRepository accidentRepository;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final drivingLicenseNumberController = TextEditingController();
  final categoryController = TextEditingController();
  final licenseDateOfExpiryController = TextEditingController();

  SecondDriverCubit({
    required this.reportBloc,
    required this.accidentRepository,
  }) : super(const SecondDriverState());

  //

  Future<void> onSubmit() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final driverB = ProfileRequestModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        birthDate: dateOfBirthController.text,
        country: countryController.text,
        address: addressController.text,
        phoneNumber:
            MyStringHelper.removeNonNumbers(phoneNumberController.text),
        driverLicense: DriverLicenseType.values
            .firstWhere((type) => type.name == categoryController.text),
        driverLicenseNumber: drivingLicenseNumberController.text,
        driverLicenseExpiredDate: licenseDateOfExpiryController.text,
      );

      await accidentRepository.updateDriverB(reportBloc.accidentId, driverB);
      emit(state.copyWith(status: Status.success));
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

  void onSelectCategoryPressed() {
    NavigationService.showDialog(dialog: const LicenseCategoryDialog())!
        .then((value) {
      if (value != null) {
        categoryController.text = value;
      }
    });
  }
}
