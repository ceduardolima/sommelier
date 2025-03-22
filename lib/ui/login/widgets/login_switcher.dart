import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class LoginSwitcher extends StatefulWidget {
  const LoginSwitcher({super.key});

  @override
  State<LoginSwitcher> createState() => _LoginSwitcherState();
}

class _LoginSwitcherState extends State<LoginSwitcher> {
  bool _loginPosition = true;
  bool _animationFinished = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginIsFocused = _loginPosition && !_animationFinished;

    return LayoutBuilder(
      builder: (context, constraint) {
        final maxWidth = constraint.maxWidth;
        final maxHeight = 50.0;

        return Container(
          constraints: constraint.copyWith(maxHeight: maxHeight),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(9999),
          ),
          padding: EdgeInsets.all(5),
          child: Stack(
            children: [
              AnimatedAlign(
                onEnd: () {
                  setState(() {
                    Logger("").info("ended");
                    _animationFinished = !_animationFinished;
                  });
                },
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOutCubic,
                alignment:
                    _loginPosition
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: Container(
                  constraints: BoxConstraints.expand(
                    height: maxHeight,
                    width: maxWidth / 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _loginPosition = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalization.of(context).get('login'),
                          style: theme.textTheme.titleSmall?.copyWith(
                            color:
                                loginIsFocused
                                    ? theme.colorScheme.onSurfaceVariant
                                    : theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _loginPosition = false;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalization.of(context).get('register'),
                          style: theme.textTheme.titleSmall?.copyWith(
                            color:
                                !loginIsFocused
                                    ? theme.colorScheme.onSurfaceVariant
                                    : theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
