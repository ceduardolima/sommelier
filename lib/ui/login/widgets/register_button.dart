import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      children: [
        Text(
          AppLocalization.of(context).get("dontHaveAccount"),
          style: TextTheme.of(context).bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalization.of(context).get("signup"),
            style: TextTheme.of(context).bodySmall?.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.onPrimary,
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
