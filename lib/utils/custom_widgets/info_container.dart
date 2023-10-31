// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class MyInfoContainer extends StatelessWidget {
  //
  final Widget child;

  final void Function()? onTap;
  final void Function()? onClose;

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onBackground,
        ),
        child: Column(
          children: [
            if (isEdit) ...[
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
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
              ),
            ],
            child,
          ],
        ),
      ),
    );
  }
}
