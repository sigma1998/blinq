// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/utils/custom_widgets/pop_ups/base_sheet.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/delete_account_event.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/delete_account_bloc.dart';

class DeleteAccountSheet extends StatelessWidget {
  //
  const DeleteAccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = DeleteAccountBloc(
      repository: getIt<AuthRepositoryImpl>(),
    );

    return BaseSheet(
      children: [
        Text(
          'strYouAreDeletingYourAccount'.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Text(
          'strRecoveryIsNotPossible'.tr(),
        ),
        const Expanded(child: SizedBox(height: 4)),
        Image.asset(
          AppDrawables.deleteAccount,
          fit: BoxFit.cover,
        ),
        const Expanded(child: SizedBox(height: 4)),
        MyButton.secondary(
          label: 'strDoNotDelete'.tr(),
          onTap: NavigationService.back,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
          bloc: bloc,
          builder: (context, state) {
            return MyButton.tertiary(
              label: 'strYesWantToDelete'.tr(),
              isLoading: state.status == Status.loading,
              onTap: () => bloc.add(OnSendCodeDeleteAccount()),
              labelStyle: const TextStyle(fontWeight: FontWeight.w500),
            );
          },
        ),
      ],
    );
  }
}
