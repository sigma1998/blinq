// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/second_driver_editors/screens/policy_holder/cubit/second_driver_policy_holder_cubit.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/picker_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/app/locator.dart';

class SecondDriverEditorPolicyHolderScreen extends StatefulWidget {
  //
  static const String route = '/second_driver_editor_policy_holder';

  const SecondDriverEditorPolicyHolderScreen({super.key});

  @override
  State<SecondDriverEditorPolicyHolderScreen> createState() =>
      _SecondDriverEditorPolicyHolderScreenState();
}

class _SecondDriverEditorPolicyHolderScreenState
    extends State<SecondDriverEditorPolicyHolderScreen> {
  //
  late SecondDriverPolicyHolderCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = SecondDriverPolicyHolderCubit(
      reportBloc: context.read<ReportBloc>(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecondDriverPolicyHolderCubit,
        SecondDriverPolicyHolderState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: KeyboardEscape(
            child: Scaffold(
              body: ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 32,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    'strInformationPolicyHolder'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 40),
                  NameTextField(
                    labelText: 'strFirstName'.tr(),
                    controller: cubit.firstNameController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strLastName'.tr(),
                    controller: cubit.lastNameController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strAddress'.tr(),
                    controller: cubit.addressController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strPostalCode'.tr(),
                    controller: cubit.postalCodeController,
                  ),
                  const SizedBox(height: 16),
                  PickerTextField(
                    labelText: 'strCountry'.tr(),
                    controller: cubit.countryController,
                    onTap: cubit.onSelectCountriesPressed,
                  ),
                  const SizedBox(height: 16),
                  PhoneTextField(
                    labelText: 'strPhoneNumber'.tr(),
                    controller: cubit.phoneNumberController,
                  ),
                  const SizedBox(height: 16),
                  NameTextField(
                    labelText: 'strEmail'.tr(),
                    controller: cubit.emailController,
                  ),
                  const SizedBox(height: 36),
                ],
              ),
              floatingActionButton: NavigationButton(
                loading: state.status == Status.loading,
                onNextTap: cubit.onSubmit,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}
