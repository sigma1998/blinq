// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class NameTextField extends StatelessWidget {
  //
  final bool autofocus;

  final FocusNode? focusNode;

  final String labelText;
  final void Function(String) onChanged;

  final bool enabled;
  final String? initialValue;

  const NameTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      key: key,
      enabled: enabled,
      labelText: labelText,
      autofocus: autofocus,
      onChanged: onChanged,
      focusNode: focusNode,
      initialValue: initialValue,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
    );
  }
}
