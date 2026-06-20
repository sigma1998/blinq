// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'default_text_field.dart';

class PickerTextField extends StatelessWidget {
  //
  final String? labelText;

  final TextEditingController controller;

  final Widget? suffixIcon;

  final void Function() onTap;

  final int minLines;
  final int maxLines;

  final bool enabled;
  final bool isRequired;
  final bool readonly;

  const PickerTextField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onTap,
    this.suffixIcon,
    //
    this.minLines = 1,
    this.maxLines = 1,
    //
    this.enabled = true,
    this.readonly = true,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      key: key,
      enabled: enabled,
      readOnly: readonly,
      minLines: minLines,
      maxLines: maxLines,
      labelText: labelText,
      controller: controller,
      onTap: readonly ? onTap : null,
      suffixIcon: GestureDetector(
        onTap: readonly ? null : onTap,
        child: suffixIcon ?? _suffixIcon,
      ),
      suffixIconConstraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
        maxHeight: 24,
        maxWidth: 32,
      ),
    );
  }

  Widget get _suffixIcon {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 22,
        color: AppColors.white,
      ),
    );
  }
}
