import 'dart:ui';

import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
      brightness: Brightness.light,
      textTheme: AppTexts.lightTextTheme);

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(primary: AppColors.primaryColor),
      brightness: Brightness.dark,
      textTheme: AppTexts.darkTextTheme);
}
