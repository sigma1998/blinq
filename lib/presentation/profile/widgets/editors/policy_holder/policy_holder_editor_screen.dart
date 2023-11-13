// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/policy_holder_editor_bloc.dart';
import 'bloc/policy_holder_editor_event.dart';

class PolicyHolderEditorScreen extends StatefulWidget {
  //
  static const String route = '/policy_holder_editor';

  const PolicyHolderEditorScreen({super.key});

  @override
  State<PolicyHolderEditorScreen> createState() =>
      _PolicyHolderEditorScreenState();
}

class _PolicyHolderEditorScreenState extends State<PolicyHolderEditorScreen> {
  //
  late final PolicyHolderEditorBloc bloc;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = PolicyHolderEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );
    bloc.initializeFields();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<PolicyHolderEditorBloc, PolicyHolderEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: MyAppBar(title: 'strPolicyHolder'.tr()),
            body: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 32,
              ),
              physics: const BouncingScrollPhysics(),
              children: [
                NameTextField(
                  labelText: 'strFirstName'.tr(),
                  controller: bloc.firstNameController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strLastName'.tr(),
                  controller: bloc.lastNameController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strAddress'.tr(),
                  controller: bloc.addressController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strPostalCode'.tr(),
                  controller: bloc.postalCodeController,
                ),
                const SizedBox(height: 16),
                PickerTextField(
                  labelText: 'strCountry'.tr(),
                  controller: bloc.countryController,
                  onTap: bloc.onSelectCountriesPressed,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strTelEmail'.tr(),
                  controller: bloc.phoneNumberController,
                ),
                const SizedBox(height: 90),
              ],
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
                    onTap: () => bloc.add(OnSubmitPolicyHolder()),
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
