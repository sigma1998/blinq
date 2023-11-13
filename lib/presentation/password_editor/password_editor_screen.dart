// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/validator.dart';
import 'bloc/password_editor_bloc.dart';
import 'bloc/password_editor_event.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  TextFieldRoundedWidget(
                    hint: 'strPasswordHint'.tr(),
                    textController: bloc.oldPasswordController,
                    // validate: (value) {
                    //   if (value.toString().isEmpty) {
                    //     return 'strPasswordHint'.tr();
                    //   } else if (Validator()
                    //       .validateStrongPassword(value.toString())) {
                    //     return 'strStrongPassword'.tr();
                    //   }
                    //   return null;
                    // },
                    labelText: 'strEnterTheCurrentPassword'.tr(),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'strEnterNewPassword'.tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFieldRoundedWidget(
                    hint: 'strPasswordHint'.tr(),
                    obscureText: !state.isCodeVisible,
                    textController: bloc.newPasswordController,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'strPasswordHint'.tr();
                      } else if (Validator()
                          .validateStrongPassword(value.toString())) {
                        return 'strStrongPassword'.tr();
                      }
                      return null;
                    },
                    suffix: IconButton(
                      splashRadius: 1,
                      onPressed: () =>
                          bloc.add(OnNewPasswordVisibilityChanged()),
                      splashColor: Colors.transparent,
                      icon: state.isCodeVisible
                          ? SvgPicture.asset(AppDrawables.eyeOpened)
                          : SvgPicture.asset(AppDrawables.eyeClosed),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextFieldRoundedWidget(
                    hint: 'strConfirmPassword'.tr(),
                    textController: bloc.confirmPasswordController,
                    obscureText: !state.isConfirmCodeVisible,
                    validate: (value) {
                      return Validator.validateConfirmPasswordMatch(
                          value: value,
                          password: bloc.newPasswordController.text);
                    },
                    suffix: IconButton(
                      splashRadius: 1,
                      onPressed: () =>
                          bloc.add(OnPasswordConfirmVisibilityChanged()),
                      splashColor: Colors.transparent,
                      icon: state.isConfirmCodeVisible
                          ? SvgPicture.asset(AppDrawables.eyeOpened)
                          : SvgPicture.asset(AppDrawables.eyeClosed),
                    ),
                  ),
                  const SizedBox(height: 48),
                  MyButton.secondary(
                    label: 'strConfirm'.tr(),
                    isLoading: state.status == Status.loading,
                    onTap: () => bloc..add(OnUpdatePassword()),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
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
