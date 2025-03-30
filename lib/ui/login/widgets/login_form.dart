import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';
import 'package:sommelier/ui/core/themes/dimens.dart';
import 'package:sommelier/ui/core/ui/widgets/FlatButton.dart';
import 'package:sommelier/ui/login/widgets/email_input.dart';
import 'package:sommelier/ui/login/widgets/forgot_password_button.dart';
import 'package:sommelier/ui/login/widgets/password_input.dart';
import 'package:sommelier/ui/login/widgets/register_button.dart';
import 'package:sommelier/ui/login/widgets/remember_password_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.onSubmit});

  final void Function(Map<String, dynamic> form) onSubmit;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return FormBuilder(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Dimens.paddingVertical,
        children: [
          EmailInput(name: "username"),
          PasswordInput(name: "password"),
          RememberPasswordButton(name: "remember"),
          FlatButton(
            onPressed: () {
              assert(
                formKey.currentState != null,
                "Form current state cant be null",
              );
              if (formKey.currentState!.saveAndValidate()) {
                onSubmit(formKey.currentState!.value);
              }
            },
            text: AppLocalization.of(context).get("signIn"),
          ),
          ForgotPasswordButton(),
          RegisterButton(),
        ],
      ),
    );
  }
}
