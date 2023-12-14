// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/license_category_dialog/license_category_dialog.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/string_helper.dart';
import 'driver_editor_event.dart';

part 'driver_editor_state.dart';
part 'driver_editor_bloc.freezed.dart';

class DriverEditorBloc extends Bloc<DriverEditorEvent, DriverEditorState> {
  //
  final ProfileBloc profileBloc;

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final drivingLicenseNumberController = TextEditingController();
  final categoryController = TextEditingController();
  final licenseDateOfExpiryController = TextEditingController();

  DriverEditorBloc({required this.profileBloc})
      : super(const DriverEditorState()) {
    on<OnSubmitDriver>(_onSubmitDriver);
  }

  void initializeFields() {
    firstNameController.text = profileBloc.state.profile?.firstName ?? '';
    lastNameController.text = profileBloc.state.profile?.lastName ?? '';
    dateOfBirthController.text = profileBloc.state.profile?.birthDate ?? '';
    addressController.text = profileBloc.state.profile?.address ?? '';
    countryController.text = profileBloc.state.profile?.country ?? '';
    phoneNumberController.text =
        MyStringHelper.phoneMask(profileBloc.state.profile?.phoneNumber ?? '');
    drivingLicenseNumberController.text =
        profileBloc.state.profile?.driverLicenseNumber ?? '';
    categoryController.text =
        profileBloc.state.profile?.driverLicense?.name ?? '';
    licenseDateOfExpiryController.text =
        profileBloc.state.profile?.driverLicenseExpiredDate ?? '';
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

  void onSelectCategoryPressed() {
    NavigationService.showDialog(dialog: const LicenseCategoryDialog())!
        .then((value) {
      if (value != null) {
        categoryController.text = value;
      }
    });
  }

  //

  FutureOr<void> _onSubmitDriver(
      OnSubmitDriver event, Emitter<DriverEditorState> emit) async {
    try {
      final profile = ProfileRequestModel(
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

      emit(state.copyWith(status: Status.loading));
      await profileBloc.onUpdateProfile(profile);
      emit(state.copyWith(status: Status.success));
      NavigationService.back(result: true);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
