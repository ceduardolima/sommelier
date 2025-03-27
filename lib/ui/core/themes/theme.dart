import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/themes/app_text_style.dart';
import 'package:sommelier/ui/core/themes/color.dart';

abstract final class AppTheme {
  static final _textTheme = AppTextThemes.lightTextTheme;
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: _textTheme,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE5E1E1)),
      ),

      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE5E1E1)),
      ),

      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFE5E1E1)),
      ),

      labelStyle: _textTheme.bodyMedium?.copyWith(color: Color(0xFFEDE0DD)),
    ),
  );
}
