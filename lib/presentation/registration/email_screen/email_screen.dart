import 'package:blinq/app/locator.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_bloc.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_event.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_state.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EmailScreen extends StatefulWidget {
  static const String route = '/email_screen';

  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  late final EmailScreenBloc bloc;
  late EmailScreenArgs args;

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as EmailScreenArgs;
    bloc = EmailScreenBloc(
        authRepository: getIt<AuthRepositoryImpl>(),
        isVerifying: args.isVerifying);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailScreenBloc, EmailScreenState>(
        bloc: bloc,
        builder: (context, state) {
          return KeyboardEscape(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 62),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppDrawables.blinq,
                      width: 62,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      (state.isCodeSent || args.isVerifying)
                          ? 'strEnterCode'.tr()
                          : 'strWelcomeBack'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFieldRoundedWidget(
                      hint: 'strYourEmail'.tr(),
                      textController: bloc.emailController,
                      validate: (value) => Validator.validateEmail(value),
                      readOnly: state.isCodeSent,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (state.isCodeSent)
                      TextFieldRoundedWidget(
                        hint: 'strEnterCode'.tr(),
                        textController: bloc.codeController,
                      ),
                    const Spacer(),
                    AppButton(
                      loading: state.status == Status.loading,
                      onTap: () => bloc.add(OnPrimaryButtonPressed()),
                      text: !state.isCodeSent
                          ? 'strSendCode'.tr()
                          : 'strSubmit'.tr(),
                      btnColor: Colors.white,
                      txtColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppButton(
                      onTap: () => bloc.add(OnSecondaryButtonPressed()),
                      text: !state.isCodeSent
                          ? 'strLogin'.tr()
                          : 'strResendCode'.tr(),
                      btnColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class EmailScreenArgs {
  final bool isVerifying;

  EmailScreenArgs({required this.isVerifying});
}
