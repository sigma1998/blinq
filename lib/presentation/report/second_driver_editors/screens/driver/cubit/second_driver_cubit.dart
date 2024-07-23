// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/scan_driver_license/cubit/scan_driver_license_cubit.dart';
import 'package:blinq/utils/date_formatter.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/license_category_dialog/license_category_dialog.dart';
import 'package:blinq/utils/string_helper.dart';

import '../../../../../../app/locator.dart';
import '../../../../../../data/model/driver_license/driver_license_model/license_model.dart';
import '../../../../../../utils/services/db/driving_license_type.dart';
import '../../policy_holder/policy_holder_screen.dart';

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
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final stateController = TextEditingController();
  final driverLicenseCountryController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final drivingLicenseNumberController = TextEditingController();
  final categoryController = TextEditingController();
  final licenseDateOfExpiryController = TextEditingController();

  List<LicenseModel> values = [];
  bool noValidity = false;

  SecondDriverCubit({
    required this.reportBloc,
    required this.scanDriverLicenseCubit,
    required this.accidentRepository,
  }) : super(const SecondDriverState()) {
    loadLicenses();
  }

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
        city: cityController.text,
        street: streetController.text,
        state: stateController.text,
        driverLicenseCountry: driverLicenseCountryController.text,
        postalCode: postalCodeController.text,
        phoneNumber:
            MyStringHelper.removeNonNumbers(phoneNumberController.text),
        driverLicense: getCategoryList(),
        driverLicenseNumber: drivingLicenseNumberController.text,
        driverLicenseExpiredDate:
            licenseDateOfExpiryController.text == 'no validity'
                ? null
                : licenseDateOfExpiryController.text,
      );

      await accidentRepository.updateDriverB(
        reportBloc.reportId,
        driverB,
      );
      reportBloc.setUser(User.B);
      emit(state.copyWith(status: Status.success));
      NavigationService.pushNamed(
        routeName: SecondDriverEditorPolicyHolderScreen.route,
        nestedKey: NavigationService.homeNavigatorKey,
      );
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  getCategoryList() {
    List<int> ids = [];
    List<String> list = categoryController.text.split(', ');
    for (var element in list) {
      for (var element2 in values) {
        if (element == element2.driverLicense) {
          ids.add(element2.id ?? 0);
        }
      }
    }
    return ids;
  }

  void onSelectCountriesPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        countryController.text = value;
      }
    });
  }

  void onSelectLicenceCountriesPressed() {
    NavigationService.showDialog(dialog: const CountriesDialog())!
        .then((value) {
      if (value != null) {
        driverLicenseCountryController.text = value;
      }
    });
  }

  loadLicenses() async {
    final db = getIt<DrivingLicenceTypeDb>();
    final list = await db.values();
    values.addAll(list);
  }

  void onSelectCategoryPressed() async {
    if (values.isEmpty) {
      await loadLicenses();
    }
    final res = await NavigationService.showDialog(
        dialog: LicenseCategoryDialog(
      chosenItems: categoryController.text.isNotEmpty
          ? categoryController.text.split(', ')
          : [],
      items: values.map<String>((e) {
        return (e.driverLicense ?? '');
      }).toList(),
    ));

    if (res != null) {
      List<String> list = res as List<String>;
      categoryController.text = list.join(', ');
    }
  }

  void setNoValidity(bool val) {
    noValidity = val;
    if (val) {
      licenseDateOfExpiryController.text = 'no validity';
    } else {
      licenseDateOfExpiryController.clear();
    }
  }
}
