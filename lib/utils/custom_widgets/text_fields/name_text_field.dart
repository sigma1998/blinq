// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class NameTextField extends StatelessWidget {
  //
  final String labelText;
  final String? initialValue;

  final void Function(String) onChanged;

  final FocusNode? focusNode;
  final int maxLines;

  final bool enabled;
  final bool autofocus;
  final bool isRequired;

  const NameTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.initialValue,
    //
    this.focusNode,
    this.maxLines = 1,
    //
    this.enabled = true,
    this.autofocus = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      key: key,
      enabled: enabled,
      maxLines: maxLines,
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
