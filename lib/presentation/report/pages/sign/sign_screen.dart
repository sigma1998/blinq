import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand_signature/signature.dart';

import 'sing_screen_bloc.dart';

class SignScreen extends StatelessWidget {
  static const String route = '/sign_screen';

  final SignScreenBloc bloc = SignScreenBloc();

  SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepIndicator(
                    currentStep: 11,
                    title: 'strBreakDown'.tr(),
                  ),
                  const SizedBox(height: 16,),
                  Text(
                    'strPleaseSign'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  RepaintBoundary(
                    key: bloc.previewContainer,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.secondary),
                      height: 200,
                      width: double.maxFinite,
                      child: HandSignature(
                        control: bloc.control,
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                        type: SignatureDrawType.line,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: AppButton(
                      height: 30,
                      width: 120,
                      onTap: () => bloc.control.clear(),
                      text: 'strClear'.tr(),
                    ),
                  ),
                  const Spacer(),
                  NavigationButton(
                    onNextTap: (){},
                    padding: 0,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
