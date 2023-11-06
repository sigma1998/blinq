// Flutter imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'default_text_field.dart';

class EmailTextField extends StatelessWidget {
  //
  final String? initialValue;

  final FocusNode? focusNode;

  final TextEditingController controller;

  final bool enabled;
  final bool autofocus;
  final bool isRequired;

  const EmailTextField({
    super.key,
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
      autofocus: autofocus,
      focusNode: focusNode,
      controller: controller,
      labelText: 'strEmail'.tr(),
      initialValue: initialValue,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
    );
  }
}
