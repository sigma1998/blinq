// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/string_helper.dart';
import 'default_text_field.dart';

class PhoneTextField extends StatelessWidget {
  //
  final bool enabled;

  final String? labelText;
  final void Function(String) onChanged;

  final String? initialValue;
  final bool autofocus;

  const PhoneTextField({
    super.key,
    required this.onChanged,
    this.labelText,
    //
    this.autofocus = false,
    this.enabled = true,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final mask = PhoneInputFormatter();

    return MyTextField(
      key: key,
      enabled: enabled,
      autofocus: autofocus,
      inputFormatters: [mask],
      keyboardType: TextInputType.phone,
      labelText: labelText ?? 'strPhoneNumber'.tr(),
      initialValue: MyStringHelper.phoneMask(initialValue),
      onChanged: (text) => onChanged(MyStringHelper.removeNonNumbers(text)),
    );
  }
}
