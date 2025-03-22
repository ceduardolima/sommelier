import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class LoginSwitcher extends StatefulWidget {
  const LoginSwitcher({
    super.key,
    required this.onChange,
    this.curve,
    this.duration,
  });

  final void Function(bool isLogin) onChange;
  final Curve? curve;
  final Duration? duration;

  @override
  State<LoginSwitcher> createState() => _LoginSwitcherState();
}

class _LoginSwitcherState extends State<LoginSwitcher> {
  static const _padding = 5.0;
  static const _maxHeight = 50.0;

  bool _loginPosition = true;
  bool _animationFinished = false;

  bool get _loginIsFocused => _loginPosition && !_animationFinished;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final circularRadius = BorderRadius.circular(9999);

    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          constraints: constraint.copyWith(maxHeight: _maxHeight),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: circularRadius,
          ),
          padding: EdgeInsets.all(_padding),
          child: Stack(
            children: [
              AnimatedAlign(
                onEnd: () {
                  setState(() {
                    _animationFinished = !_animationFinished;
                  });
                },
                duration: widget.duration ?? const Duration(milliseconds: 200),
                curve: widget.curve ?? Curves.easeInOutCubic,
                alignment:
                    _loginPosition
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: Container(
                  constraints: BoxConstraints.expand(
                    height: _maxHeight,
                    width: _switcherWidth(constraint),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: circularRadius,
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
                      onTap: _switchToLogin,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalization.of(context).get('login'),
                          style: theme.textTheme.titleSmall?.copyWith(
                            color:
                                _loginIsFocused
                                    ? theme.colorScheme.onSurfaceVariant
                                    : theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: _switchToRegister,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          AppLocalization.of(context).get('register'),
                          style: theme.textTheme.titleSmall?.copyWith(
                            color:
                                !_loginIsFocused
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

  double _switcherWidth(BoxConstraints constraint) {
    if (constraint.maxWidth <= 0) {
      return 100;
    }
    return (constraint.maxWidth / 2) - _padding;
  }

  void _switchToLogin() {
    setState(() {
      _loginPosition = true;
    });
    widget.onChange(true);
  }

  void _switchToRegister() {
    setState(() {
      _loginPosition = false;
    });
    widget.onChange(false);
  }
}
