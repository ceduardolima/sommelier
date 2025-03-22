import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:sommelier/routing/routes.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';
import 'package:sommelier/ui/core/static/assets.dart';
import 'package:sommelier/ui/core/ui/widgets/FlatButton.dart';
import 'package:sommelier/ui/core/ui/widgets/bottom_sheet_container.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final imageWidth = screenSize.width.toInt();
    final imageHeight = 250;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            Assets.splashImagePath,
            cacheHeight: imageHeight,
            cacheWidth: imageWidth,
          ),
          BottomSheetContainer(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 20,
              children: [
                Text(
                  AppLocalization.of(context).get("onBoardingTitle"),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w800,
                    height: 1,
                  ),
                ),
                Text(
                  AppLocalization.of(context).get("onBoardingBody"),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),

                FlatButton(
                  onPressed: () {
                    Logger("onBoarding").info("click");
                    context.go(Routes.login);
                  },
                  text: AppLocalization.of(context).get("startLabel"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
