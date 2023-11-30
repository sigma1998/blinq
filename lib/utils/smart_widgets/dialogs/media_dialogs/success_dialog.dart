// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:lottie/lottie.dart';

class FileUploadedSuccessfullyDialog extends StatelessWidget {
  //
  const FileUploadedSuccessfullyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      padding: const EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        children: [
          Lottie.asset(
            AppDrawables.successAnim,
            repeat: false,
            height: 84,
            width: 84,
          ),
          const SizedBox(height: 40),
          Text(
            'strMediaUploadedSuccessfully'.tr(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          MyButton.secondary(
            label: 'strGotIt'.tr(),
            onTap: NavigationService.back,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
