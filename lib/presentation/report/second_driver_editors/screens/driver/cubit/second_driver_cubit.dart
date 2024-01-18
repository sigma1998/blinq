// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/report/pages/scan_driver_license/cubit/scan_driver_license_cubit.dart';
import 'package:blinq/utils/date_formatter.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/license_category_dialog/license_category_dialog.dart';
import 'package:blinq/utils/string_helper.dart';

part 'second_driver_state.dart';
part 'second_driver_cubit.freezed.dart';

class SecondDriverCubit extends Cubit<SecondDriverState> {
  //
  final ReportBloc reportBloc;
  final ScanDriverLicenseCubit scanDriverLicenseCubit;

  final AccidentRepository accidentRepository;

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final postalCodeController = TextEditingController();
  final drivingLicenseNumberController = TextEditingController();
  final categoryController = TextEditingController();
  final licenseDateOfExpiryController = TextEditingController();

  SecondDriverCubit({
    required this.reportBloc,
    required this.scanDriverLicenseCubit,
    required this.accidentRepository,
  }) : super(const SecondDriverState());

  //

  void initializeFields() {
    final driverB = scanDriverLicenseCubit.state.driverLicenseDto;
    if (driverB == null) return;

    firstNameController.text = driverB.firstName;
    lastNameController.text = driverB.lastName;
    dateOfBirthController.text = DateFormatter.fyyyyMMdd(driverB.dateOfBirth);
    drivingLicenseNumberController.text = driverB.licenseNumber;
    categoryController.text = driverB.licenseType;
    licenseDateOfExpiryController.text =
        DateFormatter.fyyyyMMdd(driverB.expirationDate);
  }

  //

  bool validateForm() => formKey.currentState!.validate();

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
        postalCode: postalCodeController.text,
        driverLicense: DriverLicenseType.values
            .firstWhere((type) => type.name == categoryController.text),
        driverLicenseNumber: drivingLicenseNumberController.text,
        driverLicenseExpiredDate: licenseDateOfExpiryController.text,
      );

      await accidentRepository.updateDriverB(
        reportBloc.reportId,
        driverB,
      );
      reportBloc.setUser(User.B);
      emit(state.copyWith(status: Status.success));
      NavigationService.pushNamed(
        routeName: PointsOfImpactScreen.route,
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

  void onSelectCategoryPressed() {
    NavigationService.showDialog(dialog: const LicenseCategoryDialog())!
        .then((value) {
      if (value != null) {
        categoryController.text = value;
      }
    });
  }
}
