// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'default_text_field.dart';

class PickerTextField extends StatelessWidget {
  //
  final String? labelText;

  final Widget? suffixIcon;

  final void Function() onTap;

  final String? initialValue;

  final int minLines;
  final int maxLines;

  const PickerTextField({
    super.key,
    required this.labelText,
    required this.onTap,
    this.suffixIcon,
    //
    this.initialValue,
    //
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      key: key,
      onTap: onTap,
      readOnly: true,
      minLines: minLines,
      maxLines: maxLines,
      labelText: labelText,
      initialValue: initialValue,
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
      width: 16,
      height: 16,
    );
  }
}
