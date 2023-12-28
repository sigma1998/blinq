// Flutter imports:
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
          SizedBox(
            width: 45,
            height: 45,
            child: GestureDetector(
              onTap: onBack ??
                  () => NavigationService.homeNavigatorKey.currentState?.pop(),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
          ),
          if (onNextTap != null)
            MyButton.primary(
              onTap: onNextTap!,
              isLoading: loading,
              enable: canGoForward,
              label: label ?? 'strNext'.tr(),
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
