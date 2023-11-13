// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'wigets/item.dart';

class InjuryScreen extends StatelessWidget {
  //
  static const route = '/injury';

  const InjuryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        padding: const EdgeInsets.all(32),
        physics: const ClampingScrollPhysics(),
        children: [
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
