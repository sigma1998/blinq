import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/sign_in_screen/sign_in_screen_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in_screen';

  SignInScreen({Key? key}) : super(key: key);

  final SignInScreenBloc _bloc = SignInScreenBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppDrawables.welcome,
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
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
              const Spacer(),
              AppButton(
                onTap: _bloc.onSignUpPressed,
                text: 'strSignUp'.tr(),
                btnColor: Colors.white,
                txtColor: Colors.black,
              ),
              const SizedBox(
                height: 16,
              ),
              AppButton(
                onTap: _bloc.onLogInPressed,
                text: 'strLogin'.tr(),
                btnColor: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
