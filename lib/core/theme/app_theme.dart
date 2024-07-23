// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    tabBarTheme: const TabBarTheme(
      dividerColor: Colors.transparent,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.darkGrey,
      onSecondary: AppColors.grey1,
      onSecondaryContainer: AppColors.lightGrey2,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.black,
      onBackground: AppColors.darkGrey,
      surface: AppColors.darkGrey,
      onSurface: Colors.white,
      outline: AppColors.grey2,
      outlineVariant: AppColors.lightGrey,
      tertiary: AppColors.lightGreyVariant,
      secondaryContainer: AppColors.darkGreyVarient,
      surfaceVariant: AppColors.messageBackgroundColor,
      inversePrimary: AppColors.darkRedColor,
      onSurfaceVariant: AppColors.lightGrey3,
    ),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'SFUIDisplay',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 34,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
