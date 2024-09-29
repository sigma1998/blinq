import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BreakDownTypeItem extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback? onTap;

  const BreakDownTypeItem({
    super.key,
    required this.iconPath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          width: double.infinity,
          height: 108.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AppDrawables.breakDownTypeContainer,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 24),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: SvgPicture.asset(
                  iconPath,
                  width: 29,
                  height: 29,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s20W600,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                size: 14,
                color: AppColors.white.withOpacity(0.3),
                Icons.arrow_forward_ios_rounded,
              ),
              Icon(
                size: 14,
                color: AppColors.white.withOpacity(0.7),
                Icons.arrow_forward_ios_rounded,
              ),
              const Icon(
                size: 14,
                color: AppColors.white,
                Icons.arrow_forward_ios_rounded,
              ),
              const SizedBox(width: 24),
            ],
          ),
        ),
      ),
    );
  }
}
