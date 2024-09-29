import 'dart:ui';

import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/drawables/app_text_styles.dart';
import '../../inputs/custom_text_input.dart';

class UserMessage extends StatefulWidget {
  final String? message;

  const UserMessage({
    super.key,
    this.message,
  });

  @override
  State<UserMessage> createState() => _UserMessageState();
}

class _UserMessageState extends State<UserMessage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (widget.message?.isNotEmpty ?? false) {
      controller.text = widget.message!;
    }
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(36),
                ),
                color: AppColors.darkGrey,
              ),
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 24,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Container(
                    width: 36,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Text(
                        'Other',
                        style: AppTextStyles.s20W600,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    focused: true,
                    borderColor: Colors.transparent,
                    hint: 'Your message',
                    controller: controller,
                  ),
                  const SizedBox(height: 24),
                  RegularButton(
                    padding: 0,
                    title: 'Send message',
                    enable: controller.text.isNotEmpty,
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        Navigator.of(context).pop(controller.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
