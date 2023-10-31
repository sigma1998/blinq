import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen_bloc.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen_state.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/custom_textfield.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationScreen extends StatelessWidget {
  static const String route = '/registration-screen';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationScreenBloc bloc = RegistrationScreenBloc();
    return BlocBuilder<RegistrationScreenBloc, RegistrationScreenState>(
        bloc: bloc,
        builder: (context, state){
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
                  obscureText: state.firstCodeVisible,
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
                  onChanged: (v) {},
                  hint: 'strEnterName'.tr(),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFieldRoundedWidget(
                  onChanged: (v) {},
                  hint: 'strLastNameHint'.tr(),
                ),
                const SizedBox(
                  height: 88,
                ),
                AppButton(
                  onTap: () {},
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
