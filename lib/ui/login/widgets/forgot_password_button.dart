import 'package:flutter/material.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Center(
        child: Text(
          AppLocalization.of(context).get("forgetPassword"),
          style: TextTheme.of(context).bodySmall?.copyWith(
            decoration: TextDecoration.underline,
            height: 1,
            decorationColor: Theme.of(context).colorScheme.onPrimary,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
