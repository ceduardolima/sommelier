import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/themes/theme.dart';
import 'package:sommelier/ui/splash/widgets/splash_screen.dart';

void main() {
  runApp(const SommelierApp());
}

class SommelierApp extends StatelessWidget {
  const SommelierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: SplashScreen());
  }
}
