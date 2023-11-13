// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class MyInfoContainer extends StatelessWidget {
  //
  final Widget child;

  final void Function()? onTap;
  final void Function()? onClose;

  final Color color;

  final double? width;
  final double? height;

  final bool isEdit;

  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const MyInfoContainer({
    super.key,
    required this.child,
    //
    this.onTap,
    this.onClose,
    this.isEdit = false,
    this.color = AppColors.darkGrey,
    //
    this.width,
    this.height,
    //
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  @override
  Widget build(BuildContext context) {
    return MyInkWell(
      onTap: onTap,
      color: color,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      borderRadius: borderRadius,
      child: Column(
        children: [
          if (isEdit) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onClose,
                  child: SvgPicture.asset(
                    AppDrawables.close,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
          child,
        ],
      ),
    );
  }
}
