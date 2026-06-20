import 'dart:ui';

import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/components/inputs/custom_text_input.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
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
        GlassContainer(
          blur: 5,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
          child: SafeArea(
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
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [Text('Edit name', style: AppTextStyles.s17W600.copyWith(fontWeight: FontWeight.w500))],
                ),
                const SizedBox(height: 8),
                CustomTextInput(
                  hint: widget.name,
                  controller: controller,
                  borderColor: AppColors.white,
                ),
                const SizedBox(height: 24),
                GlassButton(
                  title: 'Save',
                  tint: 0.1,
                  onTap: () {
                    String? result;
                    if (controller.text.isNotEmpty) {
                      result = controller.text;
                    }
                    Navigator.of(context).pop(result);
                  },
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
