// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/navigation_service.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationButton extends StatelessWidget {
  //
  final VoidCallback onNextTap;
  final double padding;
  final VoidCallback? onBack;

  const NavigationButton(
      {super.key, required this.onNextTap, this.padding = 32, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 45,
            height: 45,
            child: FloatingActionButton(
              onPressed: onBack?? () =>
                  NavigationService.homeNavigatorKey.currentState?.pop(),
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
