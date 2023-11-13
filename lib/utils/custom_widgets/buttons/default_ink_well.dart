// Flutter imports:
import 'package:flutter/material.dart';

class MyInkWell extends StatelessWidget {
  //
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onDoubleTap;

  final BorderRadius? borderRadius;
  final BoxBorder? border;

  final Color? color;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  final double? height;
  final double? width;

  final Alignment? alignment;

  final Widget child;
  final Color? splashColor;

  const MyInkWell({
    super.key,
    required this.child,
    this.onTap,
    //
    this.color,
    this.gradient,
    this.boxShadow,
    this.splashColor,
    //
    this.onLongPress,
    this.onDoubleTap,
    //
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    //
    this.border,
    this.borderRadius,
    //
    this.height,
    this.width,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
      duration: const Duration(milliseconds: 300),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          onDoubleTap: onDoubleTap,
          splashColor: splashColor,
          borderRadius: borderRadius,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
