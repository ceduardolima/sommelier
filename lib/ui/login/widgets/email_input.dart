import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, required this.name});
  final String name;

  Color get _borderColor => Color(0xFFE5E1E1);
  Color get _textColor => Color(0xFFEDE0DD);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      cursorColor: _textColor,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: AppLocalization.of(context).get("fieldRequired"),
        ),
        FormBuilderValidators.email(
          errorText: AppLocalization.of(context).get("invalidEmail"),
        ),
      ]),
      style: TextTheme.of(context).bodyMedium?.copyWith(color: _textColor),
      decoration: InputDecoration(
        labelText: AppLocalization.of(context).get("email"),
        constraints: BoxConstraints.expand(height: 56),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: _borderColor),
        ),

        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _borderColor),
        ),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _borderColor),
        ),

        labelStyle: TextTheme.of(
          context,
        ).bodyMedium?.copyWith(color: _textColor),
      ),
    );
  }
}
