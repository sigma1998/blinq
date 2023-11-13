// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';

class SecondaryButton extends StatelessWidget {
  //
  final String label;
  final void Function() onTap;

  final Widget? iconLeft;
  final Widget? iconRight;

  final EdgeInsets margin;
  final EdgeInsets padding;

  final bool isLoading;
  final bool isEnabled;

  final Color? color;
  final TextStyle textStyle;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
    //
    this.iconLeft,
    this.iconRight,
    //
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    //
    this.isLoading = false,
    this.isEnabled = true,
    //
    this.color,
    this.textStyle = const TextStyle(color: Colors.white),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: MyInkWell(
        height: 35,
        margin: margin,
        padding: padding,
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(50),
        color: color ?? Theme.of(context).colorScheme.primary,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: Loading(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconLeft != null) ...[
                    iconLeft!,
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: textStyle,
                  ),
                  if (iconRight != null) ...[
                    const SizedBox(width: 8),
                    iconRight!,
                  ],
                ],
              ),
      ),
    );
  }
}
