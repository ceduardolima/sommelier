import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';
import 'package:sommelier/ui/core/themes/theme.dart';
import 'package:sommelier/ui/splash/widgets/splash_screen.dart';

void main() {
  runApp(const SommelierApp());
}

class SommelierApp extends StatelessWidget {
  const SommelierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale("pt", "BR"),
      supportedLocales: [Locale("pt")],
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        AppLocalizationDelegate(),
      ],
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
