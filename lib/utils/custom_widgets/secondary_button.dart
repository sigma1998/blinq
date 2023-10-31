// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'loading.dart';

class SecondaryButton extends StatelessWidget {
  //
  final String label;
  final void Function() onTap;

  final Widget? iconLeft;
  final Widget? iconRight;

  final EdgeInsets margin;
  final EdgeInsets padding;

  final bool isLoading;

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
    //
    this.color,
    this.textStyle = const TextStyle(color: Colors.white),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color ?? Theme.of(context).colorScheme.primary,
          ),
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
                      style: textStyle,
                    ),
                    if (iconRight != null) ...[
                      const SizedBox(width: 8),
                      iconRight!,
                    ],
                  ],
                )
              else
                const Center(
                  child: Loading(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
