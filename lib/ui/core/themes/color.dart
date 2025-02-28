import 'package:flutter/material.dart';

abstract final class AppColors {
  static const orange1 = Color(0xFFF4714C);
  static const orange2 = Color(0xFFF25D33);
  static const orange3 = Color(0xFFB64224);
  static const orange4 = Color(0xFFFFB4A2);
  static const white1 = Colors.white;
  static const white2 = Color(0xFFFFF8F6);
  static const white3 = Color(0xFFFEF7FF);
  static const purple1 = Color(0xFFCF94CB);
  static const green1 = Color(0xFFCCCB72);
  static const black1 = Color(0xFF49454F);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.orange1,
    onPrimary: AppColors.white1,
    surface: AppColors.white2,
    onSurface: AppColors.black1,
    onSurfaceVariant: AppColors.black1,
    onPrimaryContainer: Color(0xFF3A0A02),
    secondary: AppColors.orange2,
    onSecondary: AppColors.white1,
    error: Colors.redAccent,
    onError: AppColors.white1,
  );
}
