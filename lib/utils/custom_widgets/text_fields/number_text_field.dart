// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class NumberTextField extends StatelessWidget {
  //
  final String labelText;
  final String? initialValue;

  final void Function(int) onChanged;

  final FocusNode? focusNode;

  final bool enabled;
  final bool autofocus;
  final bool isRequired;

  const NumberTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.initialValue,
    //
    this.focusNode,
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
