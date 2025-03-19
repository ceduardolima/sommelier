import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sommelier/routing/routes.dart';
import 'package:sommelier/ui/on_boarding/widgets/on_boarding_screen.dart';
import 'package:sommelier/ui/splash/widgets/splash_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        return SplashScreen();
      },
    ),

    GoRoute(
      path: Routes.onBoarding,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: OnBoardingScreen(),
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondatyAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.linear).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
