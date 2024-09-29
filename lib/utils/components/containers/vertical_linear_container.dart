import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class VerticalLinearContainer extends StatelessWidget {
  final Widget? child;
  final double radius;
  final double padding;
  final double margin;

  const VerticalLinearContainer({
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
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.white,
                AppColors.white.withOpacity(0.6),
                AppColors.white.withOpacity(0.4),
                AppColors.white.withOpacity(0.2),
                AppColors.white.withOpacity(0.1),
              ],
            ),
          ),
          child: Container(
            padding:  EdgeInsets.all(margin),
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
