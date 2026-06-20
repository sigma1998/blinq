import 'dart:ui';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/containers/vertical_linear_container.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SketchOrPhoto extends StatelessWidget {
  final VoidCallback onCameraPressed;

  const SketchOrPhoto({
    super.key,
    required this.onCameraPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: GlassContainer(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sketch or upload a picture of the breakdown',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s20W600,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      getButton(
                          text: 'Sketch',
                          iconPath: AppDrawables.sketch,
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                      const SizedBox(width: 12),
                      getButton(
                        text: 'Camera',
                        iconPath: AppDrawables.cameraFilled,
                        onTap: onCameraPressed,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getButton({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 108,
          decoration: BoxDecoration(
            color: AppColors.grey1,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 36,
                height: 36,
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: AppTextStyles.s16W400,
              )
            ],
          ),
        ),
      ),
    );
  }
}
