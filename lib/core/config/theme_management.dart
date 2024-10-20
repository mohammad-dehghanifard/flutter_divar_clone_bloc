import 'package:flutter/material.dart';
import 'package:flutter_divar_clone_bloc/core/common/constants/ui_colors.dart';
import 'package:flutter_divar_clone_bloc/gen/fonts.gen.dart';

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
    )
  );
}