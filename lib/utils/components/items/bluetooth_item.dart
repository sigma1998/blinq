import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class BluetoothItem extends StatelessWidget {
  final String? name;

  const BluetoothItem({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: 80.h,
            height: 80.h,
            padding: const EdgeInsets.only(top: 0.5, left: 0.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.white.withOpacity(0.7),
                  AppColors.white.withOpacity(0.5),
                  AppColors.white.withOpacity(0.3),
                  AppColors.white.withOpacity(0.1),
                  AppColors.white.withOpacity(0.08),
                ], // Gradient colors
                begin: Alignment.topCenter, // Start from the top
                end: Alignment.bottomCenter, // End at the bottom
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.darkGrey),
              child: SvgPicture.asset(
                AppDrawables.bluetoothIcon,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 80,
            child: Text(
              name ?? 'Blinq',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s13W400,
            ),
          )
        ],
      ),
    );
  }
}
