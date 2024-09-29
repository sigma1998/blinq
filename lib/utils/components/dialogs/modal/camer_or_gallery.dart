import 'dart:ui';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/containers/vertical_linear_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CameraOrGallery extends StatelessWidget {
  final VoidCallback? onCameraTap;
  final VoidCallback? onGalleryTap;

  const CameraOrGallery({super.key, this.onCameraTap, this.onGalleryTap,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: VerticalLinearContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Upload a picture',
                  style: AppTextStyles.s20W600,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    getBtn(
                        iconPath: AppDrawables.cameraFilled,
                        text: 'Camera',
                        onTap: onCameraTap,
                    ),
                    const SizedBox(width: 12),
                    getBtn(
                        iconPath: AppDrawables.galleryNew,
                        text: 'Gallery',
                        onTap: onGalleryTap,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  getBtn({
    required String text,
    required String iconPath,
    required VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey1,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                iconPath,
                width: 36,
                height: 36,
              ),
              const SizedBox(height: 12),
              Text(
                text,
                style: AppTextStyles.s16W400,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
