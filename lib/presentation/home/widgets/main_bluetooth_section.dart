import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/drawables/app_drawables.dart';
import '../../../core/drawables/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class MainBluetoothSection extends StatelessWidget {
  final VoidCallback onConnectTap;
  final DiscoveredDevice? recentlyConnected;
  final bool paired;

  const MainBluetoothSection({
    super.key,
    required this.onConnectTap,
    required this.paired,
    this.recentlyConnected,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          AppDrawables.homeContainer,
          height: 434.h,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: double.infinity),
            paired
                ? Image.asset(
                    width: 220.w,
                    height: 240.h,
                    AppDrawables.bluetoothConnected,
                  )
                : Image.asset(
                    width: 220.w,
                    height: 240.h,
                    AppDrawables.bluetoothNotConnected,
                  ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 40.h,
              child: paired ? Text(
                recentlyConnected?.name ?? '',
              ) : const SizedBox(),
            ),
            GestureDetector(
              onTap: onConnectTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppDrawables.mainButton,
                    width: 244.w,
                    height: 100.h,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    paired ? 'Connected to BLINQ' : 'Connect to BLINQ',
                    style: AppTextStyles.s16W600.copyWith(
                      color: AppColors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
