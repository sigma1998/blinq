import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'sign_in_screen_bloc.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in_screen';

  SignInScreen({Key? key}) : super(key: key);

  final SignInScreenBloc _bloc = SignInScreenBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 32, left: 32, top: 64),
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
              ],
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: double.maxFinite,
                autoPlayInterval: const Duration(seconds: 2),
              ),
              items: List.generate(
                3,
                (index) => Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Image.asset(
                    '${AppDrawables.images}/iphone$index.png',
                    width: 200,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(color: Colors.black, boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 24, spreadRadius: 20)
        ]),
        padding: const EdgeInsets.only(right: 32, left: 32, bottom: 64),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
    );
  }
}
