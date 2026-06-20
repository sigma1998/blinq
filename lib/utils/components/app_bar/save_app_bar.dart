import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SaveAppBar extends StatelessWidget {
  final String title;
  final String? actionTitle;
  final VoidCallback? onActionPressed;
  final double hPadding;

  const SaveAppBar({
    super.key,
    required this.title,
    this.actionTitle,
    this.onActionPressed,
    this.hPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.white,
              size: 20,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.s15W600.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          if (actionTitle != null && onActionPressed != null)
            TextButton(
              onPressed: onActionPressed,
              child: Text(
                actionTitle ?? '',
                style: AppTextStyles.s16W400.copyWith(color: AppColors.white),
              ),
            ),
        ],
      ),
    );
  }
}
