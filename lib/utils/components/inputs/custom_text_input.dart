import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final String? hint;
  final TextEditingController controller;
  final double borderWidth;
  final Color? borderColor;
  final bool? focused;

  const CustomTextInput({
    super.key,
    this.hint,
    required this.controller,
    this.borderWidth = 1,
    this.borderColor,
    this.focused,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.black,
        border: Border.all(
          width: widget.borderWidth,
          color: widget.borderColor ?? AppColors.activeReportColor,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        autofocus: widget.focused ?? false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hint ?? 'Name',
          hintStyle: AppTextStyles.s17W400.copyWith(
            color: AppColors.white.withOpacity(0.6),
            height: 1,
          ),
        ),
      ),
    );
  }
}
