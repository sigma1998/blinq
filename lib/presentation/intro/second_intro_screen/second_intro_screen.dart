import 'dart:async';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondIntroScreen extends StatefulWidget {
  static const String route = 'second_info_screen';

  const SecondIntroScreen({Key? key}) : super(key: key);

  @override
  State<SecondIntroScreen> createState() => _SecondIntroScreenState();
}

class _SecondIntroScreenState extends State<SecondIntroScreen>
    with TickerProviderStateMixin {
  List<AnimationController> text1Controller = [];
  List<Animation<Color?>> text1ColorAnim = [];
  late Timer timer;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      text1Controller.add(AnimationController(
          duration: const Duration(milliseconds: 400), vsync: this));
    }
    for (int i = 0; i < 5; i++) {
      text1ColorAnim.add(
          ColorTween(begin: const Color(0xff5b5b5b), end: Colors.white)
              .animate(text1Controller[i])
            ..addListener(() {
              setState(() {});
            }));
    }
    _forward(0);
  }

  _forward(int initialProgress) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if ((timer.tick + initialProgress) <= text1Controller.length) {
        text1Controller[initialProgress + timer.tick - 1].forward();
      } else {
        timer.cancel();
        NavigationService.pushReplacement(routeName: SignInScreen.route);
      }
    });
  }

  _onBackGroundPressed() {
    timer.cancel();
    for (int i = 0; i < text1Controller.length; i++) {
      if (text1Controller[i].status == AnimationStatus.dismissed) {
        text1Controller[i].forward();
        _forward(i + 1);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
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
                    'strIAmPersonalAssistant'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: text1ColorAnim[0].value),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'strConnectBlinqx'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: text1ColorAnim[1].value),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'strHelpBreakdownAccidents'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: text1ColorAnim[2].value),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'strConnectFriends'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: text1ColorAnim[3].value),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    'strSendAcciendtsReports'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: text1ColorAnim[4].value),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _onBackGroundPressed,
            )
          ],
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
