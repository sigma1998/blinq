import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scale_button/scale_button.dart';

class ArrowButtonWidget extends StatelessWidget {
  const ArrowButtonWidget(
      {super.key, required this.onTap, required this.icon, this.color});

  final Function() onTap;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      bound: 0.07,
      onTap: onTap,
      child: GestureDetector(
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
              color ?? Theme.of(context).colorScheme.outline, BlendMode.srcIn),
        ),
      ),
    );
  }
}
