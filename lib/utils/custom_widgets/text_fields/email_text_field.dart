// Flutter imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class EmailTextField extends StatelessWidget {
  //
  final bool autofocus;

  final FocusNode? focusNode;

  final void Function(String) onChanged;

  final bool enabled;
  final String? initialValue;

  const EmailTextField({
    super.key,
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
      autofocus: autofocus,
      onChanged: onChanged,
      focusNode: focusNode,
      labelText: 'strEmail'.tr(),
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
    );
  }
}
