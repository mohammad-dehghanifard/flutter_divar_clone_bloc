import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/gen/fonts.gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeManagement {
  ThemeManagement._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: FontFamily.yekanBakh,
    scaffoldBackgroundColor: UiColors.scaffoldBgColor,
    colorScheme: const ColorScheme.light(
      primary: UiColors.primaryColor,
      primaryContainer: UiColors.whiteColor
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: UiColors.blackTextColor)
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: UiColors.whiteColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(4.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(4.w),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: UiColors.primaryColor),
        borderRadius: BorderRadius.circular(4.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: UiColors.primaryColor),
        borderRadius: BorderRadius.circular(4.w),
      ),
    )
  );
}