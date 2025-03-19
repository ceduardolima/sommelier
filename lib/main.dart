import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:sommelier/routing/router.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';
import 'package:sommelier/ui/core/themes/theme.dart';

void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final time = record.time;
    debugPrint(
      '[${record.level.name}][${time.hour}:${time.minute}:${time.second}:${time.millisecond}][${record.loggerName}]: ${record.message}',
    );
  });

  runApp(const SommelierApp());
}

class SommelierApp extends StatelessWidget {
  const SommelierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: Locale("pt", "BR"),
      supportedLocales: [Locale("pt")],
      localizationsDelegates: [
        ...GlobalMaterialLocalizations.delegates,
        AppLocalizationDelegate(),
      ],
      theme: AppTheme.lightTheme,
      routerConfig: router(),
    );
  }
}
