import 'package:go_router/go_router.dart';
import 'package:sommelier/routing/routes.dart';
import 'package:sommelier/ui/login/widgets/login_screen.dart';
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
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
  ],
);
