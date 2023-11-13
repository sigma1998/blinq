// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/date_picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/secondary_button.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/app/locator.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/insurance_editor_bloc.dart';
import 'bloc/insurance_editor_event.dart';

class InsuranceEditorScreen extends StatefulWidget {
  //
  static const String route = '/insurance_editor';

  const InsuranceEditorScreen({super.key});

  @override
  State<InsuranceEditorScreen> createState() => _InsuranceEditorScreenState();
}

class _InsuranceEditorScreenState extends State<InsuranceEditorScreen> {
  //

  late InsuranceEditorBloc bloc;

  @override
  void initState() {
    final profileBloc = context.read<ProfileBloc>();
    bloc = InsuranceEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );
    bloc.initializeFields();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<InsuranceEditorBloc, InsuranceEditorState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            appBar: MyAppBar(title: 'strInsurance'.tr()),
            body: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 32,
              ),
              physics: const BouncingScrollPhysics(),
              children: [
                NameTextField(
                  labelText: 'strName'.tr(),
                  controller: bloc.nameController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strPolicyNumber'.tr(),
                  controller: bloc.policyNumberController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strGreenCardNumber'.tr(),
                  controller: bloc.greenCardNumberController,
                ),
                const SizedBox(height: 16),
                Text(
                  'strInsuranceCertificateGreenCardValid'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                DatePickerTextField(
                  labelText: 'strFrom'.tr(),
                  controller: bloc.certificateValidFromController,
                ),
                const SizedBox(height: 16),
                DatePickerTextField(
                  labelText: 'strTo'.tr(),
                  controller: bloc.certificateValidToController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strAgency'.tr(),
                  controller: bloc.agencyController,
                ),
                const SizedBox(height: 16),
                NameTextField(
                  labelText: 'strAddress'.tr(),
                  controller: bloc.addressController,
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
                  controller: bloc.emailController,
                ),
                const SizedBox(height: 16),
                PickerTextField(
                  labelText: 'strPolicCover'.tr(),
                  onTap: bloc.onPolicyCoverPressed,
                  controller: bloc.policyCoverController,
                ),
                const SizedBox(height: 90),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SecondaryButton(
                    onTap: () => bloc.add(OnSubmitInsurance()),
                    label: 'strSave'.tr(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 60,
                    ),
                    isLoading: state.status == Status.loading,
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
