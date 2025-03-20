import 'package:go_router/go_router.dart';
import 'package:sommelier/routing/routes.dart';
import 'package:sommelier/routing/transitions.dart';
import 'package:sommelier/ui/login/widgets/login_screen.dart';
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
        return TransitionsFactory.getFadeTransition(
          context: context,
          state: state,
          child: const OnBoardingScreen(),
        );
      },
    ),

    GoRoute(
      path: Routes.login,
      pageBuilder: (context, state) {
        return TransitionsFactory.getSlideTransition(
          context: context,
          state: state,
          child: const LoginScreen(),
          leftToRight: false,
        );
      },
    ),
  ],
);
