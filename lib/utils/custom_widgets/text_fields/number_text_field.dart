// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class NumberTextField extends StatelessWidget {
  //
  final bool autofocus;

  final FocusNode? focusNode;

  final String labelText;
  final void Function(int) onChanged;

  final bool enabled;
  final String? initialValue;

  const NumberTextField({
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
      focusNode: focusNode,
      initialValue: initialValue,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.none,
      onChanged: (value) => onChanged(int.parse(value)),
    );
  }
}
