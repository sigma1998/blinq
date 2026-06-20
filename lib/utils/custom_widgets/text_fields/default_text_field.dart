// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

class MyTextField extends StatefulWidget {
  //
  final String? labelText;
  final String? hintText;
  final String? initialValue;

  final TextEditingController? controller;

  final TextStyle? labelTextstyle;
  final TextStyle? hintTextstyle;
  final TextStyle? inputTextstyle;

  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool obscureText;

  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  final int? minLines;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  final EdgeInsets contentPadding;

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;

  const MyTextField({
    super.key,
    this.labelText,
    this.controller,
    this.initialValue,
    //
    this.labelTextstyle = const TextStyle(
      fontSize: 20,
      color: Color(0xFF5B5B5B),
      fontWeight: FontWeight.w700,
    ),
    this.hintTextstyle = const TextStyle(
      fontSize: 26,
      color: Colors.grey,
      fontWeight: FontWeight.w700,
    ),
    this.inputTextstyle = const TextStyle(
      fontSize: 26,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    //
    this.hintText,
    this.floatingLabelBehavior,
    //
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    //
    this.focusNode,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    //
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    //
    this.contentPadding = const EdgeInsets.symmetric(vertical: 8),
    //
    this.prefixIcon,
    this.suffixIcon,
    //
    this.prefixIconConstraints = const BoxConstraints(
      minHeight: 48,
      minWidth: 48,
    ),
    this.suffixIconConstraints = const BoxConstraints(
      minHeight: 48,
      minWidth: 48,
    ),
    //
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  void initState() {
    widget.controller?.addListener(() {
      if (widget.keyboardType == TextInputType.phone) {
        if (mounted) setState(() {});
      }
    });
    widget.focusNode?.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: widget.contentPadding,
        decoration: BoxDecoration(
          color: AppColors.black.withAlpha(60),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: (widget.focusNode?.hasFocus ?? false) ? AppColors.activeReportColor : AppColors.grey2,
          )
        ),
        child: TextFormField(
          validator: widget.validator ??
              (value) {
                if (value.toString().isEmpty) {
                  return '${'strEnter'.tr()} ${widget.labelText}';
                }
                return null;
              },
          controller: widget.controller,
          //
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          textAlign: widget.textAlign,
          obscuringCharacter: '*',
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          //
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          //
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          //
          style: AppTextStyles.s17W400,
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            counterText: '',
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            //
            floatingLabelBehavior: widget.floatingLabelBehavior,
            hintText:
                widget.enabled ? ((widget.labelText?.isNotEmpty ?? false) ? '${'strEnter'.tr()} ${widget.labelText}' : widget.hintText) : null,
            hintStyle: AppTextStyles.s17W400.copyWith(color: AppColors.grey1),
            //
            filled: false,
            //
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixIconConstraints,
            //
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: widget.suffixIconConstraints,
            //
            // errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //       fontSize: 10,
            //       fontWeight: FontWeight.w500,
            //       color: Colors.red,
            //     ),
            // errorBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Theme.of(context).colorScheme.error,
            //     width: 2.0,
            //   ),
            // ),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     width: 2.0,
            //     color: Theme.of(context).colorScheme.onSecondary,
            //   ),
            // ),
            // disabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Theme.of(context).colorScheme.onSecondary,
            //     width: 2.0,
            //   ),
            // ),
            // focusedBorder: const UnderlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.white,
            //     width: 2.0,
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
