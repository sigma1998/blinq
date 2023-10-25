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
          error: Colors.red,
          onError: Colors.white,
          background: Colors.black,
          onBackground: AppColors.darkGrey,
          surface: AppColors.darkGrey,
          onSurface: Colors.white,

      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkGrey,
        centerTitle: true,
        elevation: 0

        //titleTextStyle:,

      ),
    scaffoldBackgroundColor: Colors.black
  );
}
