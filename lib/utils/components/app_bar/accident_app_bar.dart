import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/drawables/app_text_styles.dart';
import '../../navigation_service.dart';

class AccidentAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onSaveTap;
  final String? title;

  const AccidentAppBar({
    super.key,
    this.onBackTap,
    this.title,
    this.onSaveTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 80.w,
                child: IconButton(
                  icon: const Icon(
                    size: 20,
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                  onPressed: onBackTap ??
                          () {
                        NavigationService.homeNavigatorKey.currentState?.pop();
                      },
                ),
              ),
              Expanded(
                child: Text(
                  title ?? 'Accident - B driver part',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s15W600,
                ),
              ),
              TextButton(
                onPressed: () {
                  NavigationService.homeNavigatorKey.currentState
                      ?.pushNamedAndRemoveUntil(
                    HomeScreen.route,
                        (_) {
                      return false;
                    },
                  );
                },
                child: Text(
                  title ?? 'Save',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s16W600.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64.h);
}
