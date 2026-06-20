import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double height;
  final double radius;
  final double hPadding;
  final double? tint;
  final Color? backgroundColor;

  const GlassButton({
    super.key,
    required this.onTap,
    required this.title,
    this.height = 50,
    this.radius = 12,
    this.hPadding = 0,
    this.tint, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        padding: EdgeInsets.symmetric(horizontal: hPadding),
        child: GlassContainer(
          tintColor: backgroundColor ?? AppColors.white,
          tint: tint ?? 0.03,
          radius: radius,
          child: Text(
            title,
            style: AppTextStyles.s17W600.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
