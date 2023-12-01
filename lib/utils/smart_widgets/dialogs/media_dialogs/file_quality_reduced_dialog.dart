// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/navigation_service.dart';

class FileQualityReducedDialog extends StatelessWidget {
  //
  const FileQualityReducedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      padding: EdgeInsets.zero,
      height: MediaQuery.of(context).size.height * 0.48,
      margin: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        children: [
          const SizedBox(height: 48),
          Image.asset(
            AppDrawables.quality720,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 32,
            ),
            child: Column(
              children: [
                Text(
                  'strVideoQualityReducedTo720'.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 48),
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
          )
        ],
      ),
    );
  }
}
