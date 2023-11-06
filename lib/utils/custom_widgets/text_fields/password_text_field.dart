// Flutter imports:
import 'package:flutter/material.dart';

// Flutter imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'base_text_field.dart';

class PasswordTextField extends StatelessWidget {
  //
  final String? labelText;
  final String? hintText;

  final TextEditingController controller;

  final void Function(String)? onChanged;
  final VoidCallback? onVisibilityChanged;

  final FocusNode? focusNode;

  final bool enabled;
  final bool autofocus;
  final bool isRequired;
  final bool isPasswordVisible;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.onChanged,
    //
    this.labelText,
    this.hintText,
    this.onVisibilityChanged,
    //
    this.focusNode,
    //
    this.enabled = true,
    this.autofocus = false,
    this.isRequired = false,
    this.isPasswordVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      key: key,
      canClear: false,
      enabled: enabled,
      hintText: hintText,
      labelText: labelText,
      autofocus: autofocus,
      onChanged: onChanged,
      focusNode: focusNode,
      isRequired: isRequired,
      controller: controller,
      obscureText: !isPasswordVisible,
      suffixIcon: onVisibilityChanged != null
          ? IconButton(
              splashRadius: 1,
              onPressed: onVisibilityChanged,
              splashColor: Colors.transparent,
              icon: isPasswordVisible
                  ? SvgPicture.asset(AppDrawables.eyeOpened)
                  : SvgPicture.asset(AppDrawables.eyeClosed),
            )
          : null,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
