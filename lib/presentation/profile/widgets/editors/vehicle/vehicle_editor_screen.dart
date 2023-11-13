// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/number_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/secondary_button.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/app/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  //
  late VehicleEditorBloc bloc;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = VehicleEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );
    bloc.initializeFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        appBar: MyAppBar(title: 'strVehicle'.tr()),
        body: BlocBuilder<VehicleEditorBloc, VehicleEditorState>(
          bloc: bloc,
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 32,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                NameTextField(
                  labelText: 'strMakeType'.tr(),
                  controller: bloc.makeTypeController,
                ),
                const SizedBox(height: 16),
                NumberTextField(
                  labelText:
                      '${'strRegistrationNumber'.tr()} (${'strMotor'.tr()})',
                  controller: bloc.engineNumberController,
                ),
                const SizedBox(height: 16),
                PickerTextField(
                  labelText: 'strCountryRegistration'.tr(),
                  controller: bloc.countryOfRegistrationController,
                  onTap: bloc.onSelectCountryOfRegistrationPressed,
                ),
                const SizedBox(height: 16),
                NumberTextField(
                  controller: bloc.trailerRegistrationNumberController,
                  labelText:
                      '${'strRegistrationNumber'.tr()} (${'strTrailer'.tr()})',
                ),
                const SizedBox(height: 16),
                PickerTextField(
                  onTap: bloc.onSelectTrailerCountryOfRegistrationPressed,
                  controller: bloc.trailerCountryOfRegistrationController,
                  labelText:
                      '${'strCountryRegistration'.tr()} (${'strTrailer'.tr()})',
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SecondaryButton(
                      label: 'strSave'.tr(),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 60,
                      ),
                      onTap: () => bloc.add(OnSubmitVehicle()),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
