import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/themes/app_text_style.dart';
import 'package:sommelier/ui/core/themes/color.dart';

abstract final class AppTheme {
  static final _textTheme = AppTextThemes.lightTextTheme;
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: _textTheme,
    colorScheme: AppColors.lightColorScheme,
  );
}
