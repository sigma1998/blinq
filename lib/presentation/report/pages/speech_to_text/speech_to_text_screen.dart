// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/speech_to_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/step_indicator.dart';

class SpeechToTextScreen extends StatelessWidget {
  //
  static const route = '/speech_to_text';

  const SpeechToTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SpeechToTextArgs;

    return KeyboardEscape(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            StepIndicator(
              currentStep: 3,
              title: 'strBreakDown'.tr(),
            ),
            const SizedBox(height: 52),
            SpeechToTextField(
              maxLines: 10,
              canClear: false,
              labelText: args.title,
              controller: TextEditingController(),
            ),
          ],
        ),
        floatingActionButton: NavigationButton(
          onNextTap: () => args.onNextTap(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class SpeechToTextArgs {
  final String title;
  final Function() onNextTap;

  SpeechToTextArgs({
    required this.title,
    required this.onNextTap,
  });
}
