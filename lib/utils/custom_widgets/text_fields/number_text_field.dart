// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class NumberTextField extends StatelessWidget {
  //
  final String labelText;
  final String? initialValue;
  final TextEditingController controller;

  final FocusNode? focusNode;

  final bool enabled;
  final bool autofocus;
  final bool isRequired;

  const NumberTextField({
    super.key,
    required this.labelText,
    required this.controller,
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
      controller: controller,
      initialValue: initialValue,
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.none,
    );
  }
}
