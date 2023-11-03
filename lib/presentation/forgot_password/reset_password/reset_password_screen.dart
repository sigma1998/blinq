import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/forgot_password/reset_password/reset_password_screen_bloc.dart';
import 'package:blinq/presentation/forgot_password/reset_password/reset_password_screen_state.dart';
import 'package:blinq/presentation/forgot_password/reset_password/reset_password_state_event.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String route = '/reset_password_screen';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late ResetPasswordScreenBloc bloc;

  @override
  void initState() {
    bloc = ResetPasswordScreenBloc(authRepository: getIt<AuthRepositoryImpl>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordScreenBloc, ResetPasswordScreenState>(
        bloc: bloc,
        builder: (context, state){
      return KeyboardEscape(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 62),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppDrawables.blinq,
                  width: 62,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  'strPleaseCreateStrongPassword'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldRoundedWidget(
                  obscureText: !state.firstCodeVisible,
                  textController: bloc.firstCodeController,
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
                    onPressed: () =>
                        bloc.add(OnFirstPasswordVisibilityChanged()),
                    icon: state.firstCodeVisible
                        ? SvgPicture.asset(AppDrawables.eyeOpened)
                        : SvgPicture.asset(AppDrawables.eyeClosed),
                  ),
                  hint: 'strYourPassword'.tr(),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldRoundedWidget(
                  obscureText: !state.secondCodeVisible,
                  textController: bloc.secondCodeController,
                  validate: (value) {
                    return Validator.validateConfirmPasswordMatch(
                        value: value,
                        password: bloc.firstCodeController.text);
                  },
                  suffix: IconButton(
                    onPressed: () =>
                        bloc.add(OnSecondPasswordVisibilityChanged()),
                    icon: state.secondCodeVisible
                        ? SvgPicture.asset(AppDrawables.eyeOpened)
                        : SvgPicture.asset(AppDrawables.eyeClosed),
                  ),
                  hint: 'strYourPassword'.tr(),
                ),
                const Spacer(),
                AppButton(
                  loading: state.status == Status.loading,
                  onTap: () => bloc.add(OnSubmitted()),
                  text: 'strNext'.tr(),
                  btnColor: Colors.white,
                  txtColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
