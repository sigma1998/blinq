import 'package:blinq/app.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/drawables/app_text_styles.dart';
import '../../../domain/bloc/report_bloc/report_bloc.dart';
import '../../navigation_service.dart';

class ProgressAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackTap;
  final VoidCallback? onSaveTap;
  final String? title;
  final int step;

  const ProgressAppBar({
    super.key,
    this.onBackTap,
    this.title,
    required this.step,
    this.onSaveTap,
  });

  @override
  Widget build(BuildContext context) {
    final rBloc = context.read<ReportBloc>();
    return Column(
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
                rBloc.reportType.description,
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
                'Save',
                textAlign: TextAlign.center,
                style: AppTextStyles.s16W600.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width / 13 * step,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primaryColor.withOpacity(0.1),
                AppColors.primaryColor.withOpacity(0.5),
                AppColors.primaryColor.withOpacity(0.7),
                AppColors.primaryColor
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 64.h);
}
