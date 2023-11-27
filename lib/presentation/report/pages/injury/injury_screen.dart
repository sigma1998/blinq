// Flutter imports:
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/step_indicator.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'wigets/item.dart';

class InjuryScreen extends StatelessWidget {
  //
  static const route = '/injury';

  const InjuryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: ListView(
          padding: const EdgeInsets.all(32),
          physics: const ClampingScrollPhysics(),
          children: [
            StepIndicator(
              currentStep: 2,
              title: 'strBreakDown'.tr(),
            ),
            const SizedBox(height: 52),
            InjuryItem(
              title: 'strMinorInjuries'.tr(),
              onChanged: (v) {},
            ),
            const SizedBox(height: 50),
            InjuryItem(
              title: 'strDamagedVehicle'.tr(),
              onChanged: (v) {},
            ),
            const SizedBox(height: 50),
            InjuryItem(
              title: 'strDamagedBesidesVehicle'.tr(),
              onChanged: (v) {},
            ),
          ],
        ),
        floatingActionButton: NavigationButton(
          onNextTap: () => NavigationService.pushNamed(
              routeName: SpeechToTextScreen.route,
              arguments:
                  SpeechToTextArgs(mode: SpeechToTextScreenMode.witnesses),
              nestedKey: NavigationService.homeNavigatorKey),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
