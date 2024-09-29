// Flutter imports:
import 'package:blinq/core/locale/app_locale.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/number_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import '../../../../../utils/states/action_type.dart';
import 'bloc/vehicle_editor_bloc.dart';
import 'bloc/vehicle_editor_event.dart';

class VehicleEditorScreen extends StatefulWidget {
  //
  static const String route = '/vehicle_editor';

  const VehicleEditorScreen({super.key});

  @override
  State<VehicleEditorScreen> createState() => _VehicleEditorScreenState();
}

class _VehicleEditorScreenState extends State<VehicleEditorScreen> {
  /// MY CAR
  /// /// Screen is changed from vehicle to my car
  ///
  late VehicleEditorBloc bloc;


  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = VehicleEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<VehicleEditorBloc, VehicleEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: MyAppBar(title: 'strMyCar'.tr()),
            body: Form(
              key: bloc.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 32,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  PickerTextField(
                    labelText: 'strMark'.tr(),
                    controller: bloc.markController,
                    onTap: bloc.onVehicleMarkPressed,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strLicense'.tr(),
                    controller: bloc.licenseController,
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    onTap: bloc.onModelTap,
                    labelText: 'strModel'.tr(),
                    controller: bloc.modelController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strModelSeries'.tr(),
                    controller: bloc.modelSeriesController,
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    readonly: true,
                    onTap: bloc.onColorTap,
                    labelText: 'strColour'.tr(),
                    controller: bloc.colorController,
                  ),
                  const SizedBox(height: 60),
                  // PickerTextField(
                  //   labelText: 'strVehicleType'.tr(),
                  //   controller: bloc.vehicleTypeController,
                  //   onTap: bloc.onVehicleTypePressed,
                  // ),
                  // const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.makeType.tr(),
                    controller: bloc.makeTypeController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: AppLocale.plateNumber.tr(),
                    controller: bloc.plateNumberController,
                  ),
                  const SizedBox(height: 16),
                  NumberTextField(
                    labelText:
                        AppLocale.vinNumber.tr(),
                    controller: bloc.engineNumberController,
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    labelText: 'strCountryRegistration'.tr(),
                    controller: bloc.countryOfRegistrationController,
                    onTap: bloc.onSelectCountryOfRegistrationPressed,
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton.primary(
                    label: 'strSave'.tr(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 60,
                    ),
                    isLoading: state.status == Status.loading,
                    onTap: () {
                      if (bloc.validateForm()) {
                        bloc.add(OnSubmitVehicle());
                      }
                    },
                    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
