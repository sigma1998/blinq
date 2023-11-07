// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/number_text_field.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/my_vehicle_editor_event.dart';
import 'bloc/my_vehicle_editor_bloc.dart';
import 'package:blinq/app/locator.dart';

class MyVehicleEditorScreen extends StatefulWidget {
  //
  static const String route = '/my_vehicle_editor';

  const MyVehicleEditorScreen({super.key});

  @override
  State<MyVehicleEditorScreen> createState() => _MyVehicleEditorScreenState();
}

class _MyVehicleEditorScreenState extends State<MyVehicleEditorScreen> {
  //
  late MyVehicleEditorBloc bloc;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = MyVehicleEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );
    bloc.initializeFields();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<MyVehicleEditorBloc, MyVehicleEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(title: 'strMyVehicle'.tr()),
            body: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 32,
              ),
              physics: const NeverScrollableScrollPhysics(),
              children: [
                NumberTextField(
                  labelText: 'strMilesTravelled'.tr(),
                  controller: bloc.traveledKmController,
                ),
                const SizedBox(height: 16),
                NumberTextField(
                  controller: bloc.nextTechnicalController,
                  labelText: 'strNextTechnicalInspection'.tr(),
                ),
                const SizedBox(height: 16),
                NumberTextField(
                  controller: bloc.oilReplacementController,
                  labelText: 'strLastOilReplacementDate'.tr(),
                ),
                const SizedBox(height: 16),
                DatePickerTextField(
                  maxDate: DateTime.now(),
                  labelText: 'strLastBatteryReplacementDate'.tr(),
                  controller: bloc.batteryReplacementDateController,
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
                      isLoading: state.status == Status.loading,
                      onTap: () => bloc.add(OnSubmitMyVehicle()),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
