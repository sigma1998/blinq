import 'dart:ui';

import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/components/inputs/custom_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditName extends StatefulWidget {
  final String? name;

  const EditName({super.key, this.name});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.name != null) {
      controller.text = widget.name!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(36),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                  width: double.infinity,
                ),
                Container(
                  width: 36,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: AppColors.grey2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Text(
                      'Edit name',
                      style: AppTextStyles.s20W600,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hint: widget.name,
                  controller: controller,
                ),
                const SizedBox(height: 24),
                RegularButton(
                  padding: 0,
                  title: 'Save',
                  onTap: () {
                    String? result;
                    if (controller.text.isNotEmpty) {
                      result = controller.text;
                    }
                    Navigator.of(context).pop(result);
                  },
                ),
                SizedBox(height: 120.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
