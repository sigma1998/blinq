import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_bloc.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_event.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_state.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class EmailScreen extends StatelessWidget {
  static const String route = '/email_screen';

  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EmailScreenBloc>();
    return BlocBuilder<EmailScreenBloc, EmailScreenState>(
        builder: (context, state) {
      return KeyboardEscape(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 62),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                  'strWelcomeBack'.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 32,
                ),
                TextFieldRoundedWidget(
                  hint: 'strYourEmail'.tr(),
                  textController: bloc.emailController,

                ),
                const SizedBox(
                  height: 30,
                ),
                if (state.sendEmailResponse != null)
                  TextFieldRoundedWidget(
                    hint: 'strEnterCode'.tr(),
                  ),
                const Spacer(),
                AppButton(
                  loading: state.status == Status.loading,
                  onTap: () => bloc.add(OnEmailSubmitted()),
                  text: 'strSendCode'.tr(),
                  btnColor: Colors.white,
                  txtColor: Colors.black,
                ),
                const SizedBox(
                  height: 16,
                ),
                AppButton(
                  onTap: () {},
                  text: 'strResendCode'.tr(),
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
