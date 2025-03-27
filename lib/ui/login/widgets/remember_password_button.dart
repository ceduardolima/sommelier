import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sommelier/ui/core/localization/applocalization.dart';
import 'package:sommelier/ui/core/themes/dimens.dart';

class RememberPasswordButton extends StatefulWidget {
  const RememberPasswordButton({
    super.key,
    required this.name,
    this.initialValue = false,
  });
  final String name;
  final bool initialValue;

  @override
  State<RememberPasswordButton> createState() => _RememberPasswordButtonState();
}

class _RememberPasswordButtonState extends State<RememberPasswordButton> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: widget.name,
      initialValue: widget.initialValue,
      builder: (state) {
        return InkWell(
          onTap: () {
            setState(() {
              _checked = !_checked;
            });
            state.didChange(_checked);
          },
          child: Row(
            spacing: Dimens.small.toDouble(),
            children: [
              SizedBox(
                height: 22,
                width: 22,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: _checked,
                  onChanged: (value) {
                    setState(() {
                      _checked = value ?? false;
                      state.didChange(_checked);
                    });
                  },
                  side: BorderSide(color: Colors.white),
                ),
              ),
              Text(
                AppLocalization.of(context).get('rememberPassword'),
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
