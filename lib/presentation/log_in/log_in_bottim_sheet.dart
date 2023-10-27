import 'dart:io';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInBottomSheet extends StatelessWidget {
  const LogInBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: FadeInUp(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 1),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 30,),
                    Text('strLogin'.tr(),
                        style: Theme.of(context).textTheme.titleMedium),
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
                        onTap: () {},
                        child: Image.asset(
                          AppDrawables.apple,
                          height: 40,
                        ),
                      ),
                    if (Platform.isIOS)
                      const SizedBox(
                        width: 30,
                      ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppDrawables.google,
                        height: 40,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    _dividerLine(),
                    const SizedBox(
                      width: 16,
                    ),
                    Text('strOr'.tr()),
                    const SizedBox(
                      width: 16,
                    ),
                    _dividerLine(),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldRoundedWidget(
                  hint: 'strYourEmail'.tr(),
                  onChanged: (v) {},
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldRoundedWidget(
                  // obscureText: state.changeEye,
                  onChanged: (v) {},
                  suffix: IconButton(
                    onPressed: () {},
                    // onTap: () => bloc.changeEye(),
                    icon: SvgPicture.asset(AppDrawables.eyeClosed),
                  ),
                  hint: 'strYourPassword'.tr(),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  onTap: () {},
                  text: 'strLogin'.tr(),
                  btnColor: Colors.white,
                  txtColor: Colors.black,
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Text('strForgotpasswordOrEmail'.tr()),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dividerLine() {
    return Expanded(child: Container(height: 2, color: Colors.white));
  }
}
