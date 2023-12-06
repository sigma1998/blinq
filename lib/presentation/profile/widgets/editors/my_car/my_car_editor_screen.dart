// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/bloc/edit_my_car_state.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/bloc/my_car_edit_bloc.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/app/locator.dart';

class EditorMyCarScreen extends StatefulWidget {
  //
  static const String route = '/my_car_editor';

  const EditorMyCarScreen({super.key});

  @override
  State<EditorMyCarScreen> createState() => _EditorMyCarScreenState();
}

class _EditorMyCarScreenState extends State<EditorMyCarScreen> {
  late final EditMyCarBloc bloc;

  @override
  void initState() {
    bloc = EditMyCarBloc(
        profileRepository: getIt<ProfileRepositoryImpl>(),
        profileBloc: context.read<ProfileBloc>());
    bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
        child: BlocBuilder<EditMyCarBloc, EditMyCarState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: MyAppBar(title: 'strMyCar'.tr()),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 32,
                ),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    PickerTextField(
                      labelText: 'strVehicleType'.tr(),
                      onTap: bloc.onVehicleTypeTap,
                      controller: bloc.vehicleTypeController,
                    ),
                    const SizedBox(height: 16),
                    PickerTextField(
                      labelText: 'strMark'.tr(),
                      onTap: bloc.onBrandTap,
                      controller: bloc.brandController,
                    ),
                    const SizedBox(height: 16),
                    PickerTextField(
                        labelText: 'strModel'.tr(),
                        onTap: bloc.onModelTap,
                        controller: bloc.modelController),
                    const SizedBox(height: 16),
                    NameTextField(
                        labelText: 'strModelSeries'.tr(),
                        controller: bloc.modelSeriesController),
                    const SizedBox(height: 16),
                    PickerTextField(
                      labelText: 'strColour'.tr(),
                      onTap: bloc.onColorTap,
                      controller: bloc.colorController,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 155,
                      child: MyButton.primary(
                        onTap: bloc.onSubmit,
                        label: 'strSave'.tr(),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 60,
                        ),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Visibility(
                visible: state.status == Status.loading,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black26,
                  child: const Loading(),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
