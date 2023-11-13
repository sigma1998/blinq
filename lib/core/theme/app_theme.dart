import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
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
      surfaceVariant: AppColors.messageBackgroundColor
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkGrey, centerTitle: true, elevation: 0

        //titleTextStyle:,

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
        fontSize: 30,
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
