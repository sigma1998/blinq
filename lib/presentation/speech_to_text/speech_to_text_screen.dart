// Flutter imports:
import 'package:blinq/presentation/connect_to_driver/connect_to_driver_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/speech_to_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/navigation_service.dart';

class SpeechToTextScreen extends StatelessWidget {
  //
  static const route = '/speech_to_text';

  const SpeechToTextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            const SizedBox(height: 50),
            SpeechToTextField(
              maxLines: 10,
              canClear: false,
              labelText: 'strAnyWitness'.tr(),
              controller: TextEditingController(),
            ),
          ],
        ),
        floatingActionButton: NavigationButton(
          onNextTap: () => NavigationService.pushNamed(
            routeName: ConnectToDriverScreen.route,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
