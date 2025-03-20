import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef TransitionFunc =
    Page<dynamic> Function(BuildContext context, GoRouterState state);

abstract final class TransitionsFactory {
  static CustomTransitionPage getSlideTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required bool leftToRight,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) => SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: Offset(-0.75, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeIn)),
            ),
            textDirection: leftToRight ? TextDirection.ltr : TextDirection.rtl,
            child: child,
          ),
    );
  }

  static CustomTransitionPage getFadeTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondatyAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.linear).animate(animation),
          child: child,
        );
      },
    );
  }
}
