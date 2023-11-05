// Flutter imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/password_text_field.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'bloc/password_editor_bloc.dart';
import 'bloc/password_editor_event.dart';
import 'package:blinq/app/locator.dart';

class PasswordEditorScreen extends StatelessWidget {
  //
  static const route = '/password_editor';

  const PasswordEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = PasswordEditorBloc(repository: getIt<ProfileRepositoryImpl>());

    return KeyboardEscape(
      child: Scaffold(
        appBar: MyAppBar(title: 'strChangePassword'.tr()),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: BlocBuilder<PasswordEditorBloc, PasswordEditorState>(
            bloc: bloc,
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 48),
                  PasswordTextField(
                    isPasswordVisible: true,
                    hintText: 'strPasswordHint'.tr(),
                    labelText: 'strYourPassword'.tr(),
                    onChanged: (value) =>
                        bloc..add(OnOldPasswordChanged(value)),
                  ),
                  const SizedBox(height: 48),
                  PasswordTextField(
                    hintText: 'strPasswordHint'.tr(),
                    labelText: 'strEnterNewPassword'.tr(),
                    isPasswordVisible: state.isCodeVisible,
                    onVisibilityChanged: () =>
                        bloc..add(OnNewPasswordVisibilityChanged()),
                    onChanged: (value) => bloc.add(OnNewPasswordChanged(value)),
                  ),
                  const SizedBox(height: 6),
                  PasswordTextField(
                    hintText: 'strConfirmPassword'.tr(),
                    onChanged: (value) =>
                        bloc..add(OnPasswordConfirmChanged(value)),
                    isPasswordVisible: state.isConfirmCodeVisible,
                    onVisibilityChanged: () =>
                        bloc..add(OnPasswordConfirmVisibilityChanged()),
                  ),
                  const SizedBox(height: 48),
                  AppButton(
                    onTap: () => bloc..add(OnUpdatePassword()),
                    text: 'strConfirm'.tr(),
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                    loading: state.status == Status.loading,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
