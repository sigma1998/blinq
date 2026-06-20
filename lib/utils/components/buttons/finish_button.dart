import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';

class FinishButton extends StatelessWidget {
  final String email;
  final String text;
  final String iconPath;
  final VoidCallback onTap;

  const FinishButton({
    super.key,
    required this.email,
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: GlassContainer(
          radius: 20,
          tint: 0.06,
          blur: 10,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: GlassContainer(
                  isCircle: true,
                  tint: 0.16,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: AppTextStyles.s17W600,
                    ),
                    Text(
                      email,
                      style: AppTextStyles.s15W400.copyWith(
                        color: AppColors.grey2,
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(Assets.iconsThreeRightArrow),
            ],
          ),
        ),
      ),
    );
  }
}
