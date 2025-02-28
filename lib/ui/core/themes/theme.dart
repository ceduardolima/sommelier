import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/themes/color.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
  );
}
