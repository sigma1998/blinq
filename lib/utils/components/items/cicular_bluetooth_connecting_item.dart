import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularBluetoothConnectingItem extends StatelessWidget {
  final DiscoveredDevice? device;

  const CircularBluetoothConnectingItem({
    super.key,
    this.device,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(width: double.infinity),
        const Spacer(),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 160.w,
              height: 160.w,
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppDrawables.bluetoothIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(
              width: 154.w,
              height: 154.w,
              child: const CircularProgressIndicator(
                strokeWidth: 6,
                color: AppColors.white,
                strokeCap: StrokeCap.round,
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Text(
          device?.name ?? '',
          style: AppTextStyles.s20W400,
        ),
        const Spacer(),
        Text(
          'Connecting...',
          style: AppTextStyles.s17W600.copyWith(
            color: const Color(0xffFCFCFC),
          ),
        ),
        SizedBox(height: 120.h),
      ],
    );
  }
}
