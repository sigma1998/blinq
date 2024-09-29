import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhotoItem extends StatelessWidget {
  final VoidCallback onTap;

  const PhotoItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.grey2,
          ),
        ),
        child: Container(
          width: 44,
          height: 44,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AppDrawables.cameraFilled,
          ),
        ),
      ),
    );
  }
}
