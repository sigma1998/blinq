// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/navigation_service.dart';

class NavigationButton extends StatelessWidget {
  //
  final String? label;

  final VoidCallback? onBack;
  final VoidCallback? onNextTap;
  final bool canGoForward;
  final bool loading;
  final double padding;
  final double height;

  const NavigationButton({
    super.key,
    this.onNextTap,
    //
    this.height = 0,
    //
    this.canGoForward = true,
    this.label,
    this.padding = 32,
    this.loading = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: height,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: RegularButton(
              padding: 0,
              background: AppColors.darkGrey,
              title: 'Back',
              onTap: onBack ??
                      () => NavigationService.homeNavigatorKey.currentState?.pop(),
            ),
          ),
          const SizedBox(width: 8),
          if (onNextTap != null)
          Expanded(
            child: RegularButton(
              enable: canGoForward,
              padding: 0,
              title: 'Next',
              onTap: onNextTap!,
            ),
          ),
        ],
      ),
    );
  }
}
