import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
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
      child: Container(
        width: double.infinity,
        height: 100.h,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.16),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.black,
              ),
              child: SvgPicture.asset(
                iconPath,
                width: 28,
                height: 28,
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
            SvgPicture.asset(
              AppDrawables.right,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
