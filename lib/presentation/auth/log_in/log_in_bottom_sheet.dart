// Dart imports:
import 'dart:io';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/validator.dart';
import 'bloc/login_bottom_sheet_bloc.dart';
import 'bloc/login_bottom_sheet_event.dart';
import 'bloc/login_bottom_sheet_state.dart';

class LogInBottomSheet extends StatefulWidget {
  const LogInBottomSheet({Key? key}) : super(key: key);

  @override
  State<LogInBottomSheet> createState() => _LogInBottomSheetState();
}

class _LogInBottomSheetState extends State<LogInBottomSheet> {
  late final LoginBottomSheetBloc bloc;

  @override
  void initState() {
    bloc = LoginBottomSheetBloc(authRepository: getIt<AuthRepositoryImpl>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBottomSheetBloc, LoginBottomSheetState>(
      bloc: bloc,
      builder: (context, state) {
        return KeyboardEscape(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 30),
                      Text(
                        'strLogin'.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      InkWell(
                        onTap: () => NavigationService.back(),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Theme.of(context).colorScheme.primary,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (Platform.isIOS)
                        InkWell(
                          onTap: () => bloc.add(OnAppleSelected()),
                          child: Image.asset(
                            AppDrawables.apple,
                            height: 40,
                          ),
                        ),
                      if (Platform.isIOS) const SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          print('ON GOOGLE SELECTED____');
                          bloc.add(OnGoogleSelected());
                        },
                        child: Image.asset(
                          AppDrawables.google,
                          height: 40,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      _dividerLine(),
                      const SizedBox(width: 16),
                      Text('strOr'.tr()),
                      const SizedBox(width: 16),
                      _dividerLine(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFieldRoundedWidget(
                    hint: 'strYourEmail'.tr(),
                    inputType: TextInputType.emailAddress,
                    textController: bloc.mailController,
                    validate: (value) => Validator.validateEmail(value),
                  ),
                  const SizedBox(height: 30),
                  TextFieldRoundedWidget(
                    obscureText: !state.isCodeVisible,
                    textController: bloc.passwordController,
                    suffix: IconButton(
                      onPressed: () =>
                          bloc.add(OnPasswordVisibilityChanged()),
                      icon: state.isCodeVisible
                          ? SvgPicture.asset(AppDrawables.eyeOpened)
                          : SvgPicture.asset(AppDrawables.eyeClosed),
                    ),
                    hint: 'strYourPassword'.tr(),
                  ),
                  const SizedBox(height: 30),
                  MyButton.secondary(
                    label: 'strLogin'.tr(),
                    onTap: () => bloc.add(OnSubmitted()),
                    isLoading: state.status == Status.loading,
                    labelStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                            ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () => bloc.add(OnForgotPasswordPressed()),
                    child: Text('strForgotpasswordOrEmail'.tr()),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dividerLine() {
    return Expanded(
      child: Container(
        height: 2,
        color: Colors.white,
      ),
    );
  }
}
