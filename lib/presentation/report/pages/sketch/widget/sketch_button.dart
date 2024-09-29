import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/drawables/app_drawables.dart';
import '../../../../../core/drawables/app_text_styles.dart';
import '../../../../../core/theme/app_colors.dart';

class SketchButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  const SketchButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.s22W600,
          ),
        ),
        IconButton(
          onPressed: onPressed  ,
          icon: Container(
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: SvgPicture.asset(
              iconPath,
            ),
          ),
        )
      ],
    );
  }
}
