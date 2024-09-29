import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class HorizontalTopContainer extends StatelessWidget {
  final Widget? child;
  final double radius;
  final double padding;
  final double margin;

  const HorizontalTopContainer({
    super.key,
    this.child,
    this.radius = 20,
    this.padding = 16,
    this.margin = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 1,
            right: 1,
            top: 1,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [
                AppColors.white.withOpacity(0.2),
                AppColors.white.withOpacity(0.6),
                AppColors.white.withOpacity(0.6),
                AppColors.white.withOpacity(0.2),
              ],
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: AppColors.darkGrey,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
