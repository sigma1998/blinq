import 'dart:async';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/intro/second_intro_screen/second_intro_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstIntroScreen extends StatefulWidget {
  static const String route = 'first_info_screen';

  const FirstIntroScreen({Key? key}) : super(key: key);

  @override
  State<FirstIntroScreen> createState() => _FirstIntroScreenState();
}

class _FirstIntroScreenState extends State<FirstIntroScreen>
    with TickerProviderStateMixin {
  List<AnimationController> text1Controller = [];
  List<Animation<Color?>> text1ColorAnim = [];
  late Timer timer;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      text1Controller.add(AnimationController(
          duration: const Duration(milliseconds: 400), vsync: this));
    }
    for (int i = 0; i < 2; i++) {
      text1ColorAnim.add(
          ColorTween(begin: const Color(0xff5b5b5b), end: Colors.white)
              .animate(text1Controller[i])
            ..addListener(() {
              setState(() {});
            }));
    }
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (timer.tick <= text1Controller.length) {
        text1Controller[timer.tick - 1].forward();
      } else {
        timer.cancel();
        NavigationService.pushReplacement(routeName: SecondIntroScreen.route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 198, left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppDrawables.blinq,
                width: 62,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'strHello'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: text1ColorAnim[0].value),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'strThanksForUsingBlinq'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: text1ColorAnim[1].value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    for (var element in text1Controller) {
      element.dispose();
    }
    super.dispose();
  }
}
