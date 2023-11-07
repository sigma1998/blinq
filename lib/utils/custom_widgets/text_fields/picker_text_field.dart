// Flutter imports:
import 'package:flutter/material.dart';
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
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      key: key,
      onTap: onTap,
      readOnly: true,
      enabled: enabled,
      minLines: minLines,
      maxLines: maxLines,
      labelText: labelText,
      controller: controller,
      suffixIcon: suffixIcon ?? _suffixIcon,
      suffixIconConstraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
        maxHeight: 24,
        maxWidth: 24,
      ),
    );
  }

  Widget get _suffixIcon {
    return SvgPicture.asset(
      AppDrawables.arrowDown,
      width: 24,
      height: 24,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    );
  }
}
