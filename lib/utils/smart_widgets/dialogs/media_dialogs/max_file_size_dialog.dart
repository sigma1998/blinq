// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/navigation_service.dart';

class MaxFileSizeDialog extends StatelessWidget {
  //
  final String title;
  final String decription;

  final String icon;

  MaxFileSizeDialog.video({
    super.key,
  })  : title = 'strVideoSizeExceeds'.tr(),
        decription = 'strTryToReduceVideoSize'.tr(),
        icon = AppDrawables.videoSize80;

  MaxFileSizeDialog.image({
    super.key,
  })  : title = 'strImageSizeExceeds'.tr(),
        decription = 'strTryToReduceImageSize'.tr(),
        icon = AppDrawables.imageSize10;

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
      height: MediaQuery.of(context).size.height * 0.58,
      margin: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        children: [
          Image.asset(
            icon,
            width: 174,
            height: 64,
          ),
          const SizedBox(height: 36),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            decription,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
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
