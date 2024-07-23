// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/countries_dialog/countries_dialog.dart';
import 'package:blinq/utils/smart_widgets/dialogs/license_category_dialog/license_category_dialog.dart';
import 'package:blinq/utils/string_helper.dart';
import '../../../../../../app/locator.dart';
import '../../../../../../core/locale/app_locale.dart';
import '../../../../../../data/model/driver_license/driver_license_model/license_model.dart';
import '../../../../../../utils/services/db/driving_license_type.dart';
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
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final streetController = TextEditingController();
  final driverLicenseCountryController = TextEditingController();
  final zipController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final categoryController = TextEditingController();
  final drivingLicenseNumberController = TextEditingController();
  final licenseDateOfExpiryController = TextEditingController();

  List<LicenseModel> values = [];

  bool noValidity = false;

  DriverEditorBloc({required this.profileBloc})
      : super(const DriverEditorState()) {
    on<OnSubmitDriver>(_onSubmitDriver);

    loadLicenses();
  }

  void initializeFields() {
    firstNameController.text = profileBloc.state.profile?.firstName ?? '';
    lastNameController.text = profileBloc.state.profile?.lastName ?? '';
    dateOfBirthController.text = profileBloc.state.profile?.birthDate ?? '';
    countryController.text = profileBloc.state.profile?.country ?? '';
    cityController.text = profileBloc.state.profile?.city ?? '';
    stateController.text = profileBloc.state.profile?.state ?? '';
    streetController.text = profileBloc.state.profile?.street ?? '';
    driverLicenseCountryController.text =
        profileBloc.state.profile?.driverLicenseCountry ?? '';
    zipController.text = profileBloc.state.profile?.postalCode ?? '';
    phoneNumberController.text =
        MyStringHelper.phoneMask(profileBloc.state.profile?.phoneNumber ?? '');
    drivingLicenseNumberController.text =
        profileBloc.state.profile?.driverLicenseNumber ?? '';
    categoryController.text =
        profileBloc.state.profile?.driverLicense?.join(', ') ?? '';
    licenseDateOfExpiryController.text =
        profileBloc.state.profile?.driverLicenseExpiredDate ?? AppLocale.noValidityDate.tr();
    noValidity =
        (profileBloc.state.profile?.driverLicenseExpiredDate ?? '').isEmpty;
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
      items: values.map<String>((e) {
        return (e.driverLicense ?? '');
      }).toList(),
      chosenItems: profileBloc.state.profile?.driverLicense,
    ));

    if (res != null) {
      List<String> list = res as List<String>;
      // StringBuffer sb = StringBuffer();
      // for (var element in list) {
      //   sb.write('$element, ');
      // }
      categoryController.text =
          list.join(', '); //sb.toString().removeLast().removeLast();
    }
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
        city: cityController.text,
        street: streetController.text,
        state: stateController.text,
        driverLicenseCountry: driverLicenseCountryController.text,
        postalCode: zipController.text,
        phoneNumber: phoneNumberController.text,
        driverLicense: getCategoryList(),
        driverLicenseNumber: drivingLicenseNumberController.text,
        driverLicenseExpiredDate:
            noValidity ? null : licenseDateOfExpiryController.text,
      );

      emit(state.copyWith(status: Status.loading));
      await profileBloc.onUpdateProfile(profile);
      emit(state.copyWith(status: Status.success));
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
      if (emailRegex.hasMatch(phoneNumberController.text)) {
        return phoneNumberController.text;
      } else {
        return null;
      }
    } else {
      if (phoneRegex.hasMatch(phoneNumberController.text)) {
        return phoneNumberController.text;
      } else {
        return null;
      }
    }
  }

  setNoValidity(bool val) {
    noValidity = val;
    if (val) {
      licenseDateOfExpiryController.text = AppLocale.noValidityDate.tr();
    } else {
      licenseDateOfExpiryController.clear();
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
}
