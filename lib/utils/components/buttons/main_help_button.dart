import 'dart:ui';

import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/drawables/app_text_styles.dart';

class MainHelpButton extends StatelessWidget {
  final VoidCallback onTap;

  const MainHelpButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 220.h,
        height: 220.h,
        child: GlassContainer(
          isCircle: true,
          child: Padding(
            padding:  EdgeInsets.all(24.h),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment(0.44, -0.90),
                  end: Alignment(-0.44, 0.90),
                  colors: [Color(0xFFFF564D), Color(0xFFFF2D21)],
                  stops: [0.2439, 0.7691],
                ),
              ),
              child:  const Text(
                'HELP',
                style: AppTextStyles.s32W700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
