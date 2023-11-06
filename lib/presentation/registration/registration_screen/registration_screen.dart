import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen_bloc.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen_event.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen_state.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = '/registration-screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final RegistrationScreenBloc bloc;

  @override
  void initState() {
    bloc = RegistrationScreenBloc(authRepository: getIt<AuthRepositoryImpl>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocBuilder<RegistrationScreenBloc, RegistrationScreenState>(
      bloc: bloc,
      builder: (context, state) {
        return KeyboardEscape(
          child: Scaffold(
            body: SingleChildScrollView(
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
                    style: Theme.of(context).textTheme.titleSmall,
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
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    'strEnterYourNameAndSureName'.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldRoundedWidget(
                    textController: bloc.firstNameController,
                    hint: 'strEnterName'.tr(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFieldRoundedWidget(
                    textController: bloc.secondNameController,
                    hint: 'strLastNameHint'.tr(),
                  ),
                  const SizedBox(
                    height: 88,
                  ),
                  AppButton(
                    loading: state.status == Status.loading,
                    onTap: () => bloc.add(OnSubmitted(email: email)),
                    text: 'strNext'.tr(),
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
