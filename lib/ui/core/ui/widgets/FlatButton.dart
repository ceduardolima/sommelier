import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  const FlatButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
  });
  final String text;
  final void Function() onPressed;

  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: textColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
