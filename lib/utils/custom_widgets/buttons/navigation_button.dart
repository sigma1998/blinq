// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/navigation_service.dart';

class NavigationButton extends StatelessWidget {
  //
  final VoidCallback onNextTap;

  const NavigationButton({
    super.key,
    required this.onNextTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: FloatingActionButton(
              onPressed: NavigationService.back,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: SvgPicture.asset(
                AppDrawables.arrowLeft,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          MyButton.primary(
            onTap: onNextTap,
            label: 'strNext'.tr(),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            iconRight: SvgPicture.asset(
              AppDrawables.arrowRight,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          )
        ],
      ),
    );
  }
}
