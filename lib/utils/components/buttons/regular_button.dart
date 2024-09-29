import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  final Color? background;
  final double padding;
  final bool enable;
  final Color borderColor;
  final Widget? child;
  final bool loading;

  const RegularButton({
    super.key,
    this.title,
    this.onTap,
    this.background,
    this.padding = 16,
    this.enable = true,
    this.borderColor = Colors.transparent,
    this.child,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Stack(
        children: [
          Container(
            height: 50.h,
            width: double.infinity,
            padding: const EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white.withOpacity(0.8),
                    AppColors.white.withOpacity(0.6),
                    AppColors.white.withOpacity(0.4),
                    AppColors.white.withOpacity(0.2),
                    AppColors.white.withOpacity(0.1),
                    AppColors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (background ?? AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),
                  child: loading
                      ? SizedBox(
                          height: 30.h,
                          width: 30.h,
                          child: const Loading(),
                        )
                      : child ??
                          Text(
                            title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.s17W600,
                          )),
            ),
          ),
          if (!enable)
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.darkGrey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: borderColor,
                ),
              ),
            ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: enable && !loading ? onTap : null,
              borderRadius: BorderRadius.circular(28),
              child: SizedBox(
                height: 48.h,
                width: double.infinity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
