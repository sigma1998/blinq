// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/base_sheet.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/delete_account_bloc.dart';
import 'bloc/delete_account_event.dart';
import 'package:blinq/app/locator.dart';

class DeleteAccountSheet extends StatelessWidget {
  //
  const DeleteAccountSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = DeleteAccountBloc(
      repository: getIt<AuthRepositoryImpl>(),
    );

    return MyBaseSheet(
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
        AppButton(
          btnColor: Colors.white,
          txtColor: Colors.black,
          text: 'strDoNotDelete'.tr(),
          onTap: NavigationService.back,
        ),
        const SizedBox(height: 16),
        BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
          bloc: bloc,
          builder: (context, state) {
            return AppButton(
              txtColor: Colors.white,
              text: 'strYesWantToDelete'.tr(),
              loading: state.status == Status.loading,
              onTap: () => bloc.add(OnSendCodeDeleteAccount()),
              btnColor: Theme.of(context).colorScheme.onSecondary,
            );
          },
        ),
      ],
    );
  }
}
