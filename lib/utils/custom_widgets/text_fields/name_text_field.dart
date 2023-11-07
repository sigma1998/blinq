// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class NameTextField extends StatelessWidget {
  //
  final String labelText;
  final String? initialValue;

  final void Function(String)? onChanged;
  final TextEditingController controller;

  final FocusNode? focusNode;
  final int maxLines;

  final bool enabled;
  final bool autofocus;
  final bool isRequired;

  const NameTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.onChanged,
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
      controller: controller,
      initialValue: initialValue,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
    );
  }
}
