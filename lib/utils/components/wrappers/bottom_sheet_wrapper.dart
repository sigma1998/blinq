import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class BottomSheetGlassWrapper extends StatelessWidget {
  final Widget child;

  const BottomSheetGlassWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GlassContainer(
          tint: 0.04,
          blur: 6,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 12.h),
                    Container(
                      width: 36,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
                      child: child,
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
