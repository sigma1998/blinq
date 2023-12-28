// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

class RoundedTextField extends StatefulWidget {
  //
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final String? errorText;

  final TextEditingController? controller;

  final String? Function(String?)? validator;

  final TextStyle? labelTextstyle;
  final TextStyle? hintTextstyle;
  final TextStyle? inputTextstyle;

  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool obscureText;
  final bool isRequired;
  final bool canClear;
  final bool isLoading;
  final bool isValid;
  final bool isOutlined;

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
  final EdgeInsets contentPadding;

  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;

  const RoundedTextField({
    this.labelText,
    this.controller,
    this.validator,
    this.initialValue,
    //
    this.labelTextstyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    this.hintTextstyle = const TextStyle(
      fontSize: 16,
      color: Color(0xFF4D4D4D),
      fontWeight: FontWeight.w700,
    ),
    this.inputTextstyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
    ),
    //
    this.hintText,
    this.errorText,
    this.floatingLabelBehavior,
    //
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.obscureText = false,
    this.isRequired = false,
    this.canClear = true,
    this.isLoading = false,
    this.isValid = true,
    this.isOutlined = false,
    //
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    //
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.inputFormatters,
    //
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 18,
    ),
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
    Key? key,
  }) : super(key: key);

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  //
  late FocusNode focusNode;
  late TextEditingController controller;

  bool get showClear =>
      widget.canClear && focusNode.hasFocus && controller.text.isNotEmpty;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();

    controller.text = widget.initialValue ?? '';

    if (widget.canClear) {
      controller.addListener(updateState);
      focusNode.addListener(updateState);
    }
    super.initState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    if (widget.canClear) {
      controller.removeListener(updateState);
      focusNode.removeListener(updateState);
    }
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Row(
            children: [
              if (widget.isRequired) ...[
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.labelText,
                        style: widget.labelTextstyle,
                      ),
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Text(
                  widget.labelText!,
                  style: widget.labelTextstyle,
                ),
              ],
              if (widget.isLoading) ...[
                const SizedBox(width: 8),
                SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 10),
        ],
        Stack(
          children: [
            TextFormField(
              controller: controller,
              validator: widget.validator ??
                  (value) {
                    if (value.toString().isEmpty) {
                      return '${'strEnter'.tr()} ${widget.labelText}';
                    }
                    return null;
                  },
              //
              focusNode: focusNode,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              autofocus: widget.autofocus,
              cursorColor: Colors.white,
              textAlign: widget.textAlign,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              //
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              buildCounter: buildCounter,
              inputFormatters: widget.inputFormatters,
              //
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete,
              //
              style: widget.inputTextstyle,
              decoration: _decoration,
            ),
            if (showClear && widget.maxLines > 1)
              Positioned(
                top: 8,
                right: 6,
                child: clearButton(),
              ),
          ],
        ),
        if (!widget.isValid) ...[
          const SizedBox(height: 8),
          Text(
            widget.errorText ?? '${'strEnter'.tr()} ${widget.labelText}',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ]
      ],
    );
  }

  Widget clearButton() {
    return GestureDetector(
      onTap: onClear,
      child: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          CupertinoIcons.xmark_circle,
          size: 28,
          color: Colors.grey,
        ),
      ),
    );
  }

  void onClear() {
    controller.clear();
    widget.onChanged?.call('');
  }

  InputDecoration get _decoration {
    return InputDecoration(
      isDense: true,
      contentPadding: widget.contentPadding,
      //
      hintStyle: widget.hintTextstyle,
      hintText: widget.enabled
          ? widget.hintText ?? '${'strEnter'.tr()} ${widget.labelText}'
          : '',
      floatingLabelBehavior: widget.floatingLabelBehavior,
      //
      prefixIcon: widget.prefixIcon,
      prefixIconConstraints: widget.prefixIconConstraints,
      //
      suffixIcon: showClear
          ? (widget.maxLines == 1 ? clearButton() : Container())
          : widget.suffixIcon,
      suffixIconConstraints: widget.suffixIconConstraints,
      //
      filled: true,
      fillColor: widget.enabled
          ? Theme.of(context).colorScheme.onBackground
          : Theme.of(context).colorScheme.onSecondary,
      //
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorMaxLines: 2,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: widget.isOutlined
                ? Theme.of(context).colorScheme.outlineVariant
                : Colors.transparent),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
    );
  }

  Widget? buildCounter(
    BuildContext context, {
    required int currentLength,
    required int? maxLength,
    required bool isFocused,
  }) {
    return null;
  }
}
