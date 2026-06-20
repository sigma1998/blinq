import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return GlassContainer(
      radius: 26,
      blur: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 48.h, width: double.infinity),
          paired
              ? SizedBox(
                  height: 200.h,
                  width: 240.w,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(height: 200.h, width: 240.w, Assets.imagesBluetoothConnected),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Text(
                          recentlyConnected?.name ?? 'asxsxasx',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.s17W600.copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                )
              : Image.asset(height: 200.h, width: 240.w, Assets.imagesBluetoothNotConnected),
          SizedBox(height: 36.h),
          GestureDetector(
            onTap: onConnectTap,
            child: Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: GlassContainer(
                radius: 12,
                blur: paired ? 10 : 40,
                tintColor: AppColors.white.withAlpha(paired ? 150 : 0),
                child: Text(
                  paired ? 'Connected to BLINQ' : 'Connect to BLINQ',
                  style: AppTextStyles.s17W600.copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
