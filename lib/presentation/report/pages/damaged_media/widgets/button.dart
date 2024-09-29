// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';

class DamagedMediaButton extends StatelessWidget {
  //
  final VoidCallback onTap;

  const DamagedMediaButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 144,
        height: 144,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.darkGrey,
        ),
        child: Container(
          width: 112,
          height: 112,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.grey1,
          ),
          child: SvgPicture.asset(
            AppDrawables.camerNew,
            width: 48,
          ),
        ),
      ),
    );

  }
}
