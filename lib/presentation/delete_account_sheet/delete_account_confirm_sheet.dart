// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/rounded_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/pop_ups/base_sheet.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/delete_account_event.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/delete_account_bloc.dart';

class DeleteAccountConfirmSheet extends StatelessWidget {
  //
  const DeleteAccountConfirmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = DeleteAccountBloc(
      repository: getIt<AuthRepositoryImpl>(),
    );

    return KeyboardEscape(
      child: BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
        bloc: bloc,
        builder: (context, state) {
          return BaseSheet(
            children: [
              Text(
                'strConfirmYourAccount'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                'strIfYouWantToDelete'.tr(),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return Text(
                    '${state.profile?.email}',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  );
                },
              ),
              const SizedBox(height: 10),
              RoundedTextField(
                isOutlined: true,
                hintText: 'strEnterCode'.tr(),
                controller: bloc.codeController,
                keyboardType: TextInputType.number,
              ),
              const Expanded(child: SizedBox(height: 4)),
              MyButton.secondary(
                label: 'strConfirm'.tr(),
                isLoading: state.status == Status.loading,
                onTap: () => bloc.add(OnVerifyDeleteAccount()),
                labelStyle: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      ),
    );
  }
}
