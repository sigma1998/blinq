// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'default_ink_well.dart';

class PrimaryButton extends StatelessWidget {
  //
  final String label;
  final void Function() onTap;
  final void Function()? onLongPress;

  final Widget? iconLeft;
  final Widget? iconRight;

  final EdgeInsets padding;
  final EdgeInsets margin;

  final bool isLoading;
  final bool enable;

  final double? width;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.onLongPress,
    //
    this.iconLeft,
    this.iconRight,
    //
    this.padding = const EdgeInsets.symmetric(
      vertical: 12,
      horizontal: 32,
    ),
    this.margin = EdgeInsets.zero,
    //
    this.isLoading = false,
    this.enable = true,
    //
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 250),
      child: MyInkWell(
        width: width,
        margin: margin,
        padding: padding,
        borderRadius: BorderRadius.circular(50),
        onTap: enable && !isLoading ? onTap : null,
        color: enable || isLoading
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSecondary,
        child: Stack(
          children: [
            if (!isLoading)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconLeft != null) ...[
                    iconLeft!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  if (iconRight != null) ...[
                    const SizedBox(width: 8),
                    iconRight!,
                  ],
                ],
              )
            else
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 19,
                    width: 19,
                    child: Loading(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
