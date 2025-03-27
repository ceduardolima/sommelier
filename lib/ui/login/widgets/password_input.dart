import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key, required this.name});
  final String name;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  Color get _borderColor => Color(0xFFE5E1E1);
  Color get _textColor => Color(0xFFEDE0DD);

  IconData get _suffixIcon =>
      _obscureText ? Icons.visibility_off : Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      cursorColor: _textColor,
      obscureText: _obscureText,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
          errorText: AppLocalization.of(context).get("fieldRequired"),
        ),
      ]),
      style: TextTheme.of(context).bodyMedium?.copyWith(color: _textColor),
      decoration: InputDecoration(
        labelText: AppLocalization.of(context).get("password"),
        constraints: BoxConstraints.expand(height: 56),
        suffixIcon: IconButton(
          onPressed: _toggleObscureText,
          icon: Icon(_suffixIcon, size: 14, color: _textColor),
        ),
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

  void _toggleObscureText() => setState(() => _obscureText = !_obscureText);
}
