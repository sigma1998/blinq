import 'dart:async';

import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularBluetoothSearchingAnimation extends StatefulWidget {
  final bool scanning;

  const CircularBluetoothSearchingAnimation({
    super.key,
    required this.scanning,
  });

  @override
  State<CircularBluetoothSearchingAnimation> createState() => _CircularBluetoothSearchingAnimationState();
}

class _CircularBluetoothSearchingAnimationState extends State<CircularBluetoothSearchingAnimation> {
  final period = const Duration(milliseconds: 300);
  late final Timer timer;
  final double size = 110;
  int range = 0;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (time) {
        if (widget.scanning) {
          setState(
            () {
              if (range >= 5) {
                range = 0;
              } else {
                range++;
              }
            },
          );
        } else {
          setState(() {
            range = 0;
          });
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 360.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            width: getFourthCircleSize(),
            height: getFourthCircleSize(),
            duration: period,
            decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.05),
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white.withAlpha(25))
            ),
          ),
          AnimatedContainer(
            width: getThirdCircleSize(),
            height: getThirdCircleSize(),
            duration: period,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.06),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white.withAlpha(25))
            ),
          ),
          AnimatedContainer(
            width: getSecondCircleSize(),
            height: getSecondCircleSize(),
            duration: period,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.07),
              shape: BoxShape.circle,
                border: Border.all(color: AppColors.white.withAlpha(25))
            ),
          ),
          AnimatedContainer(
            width: getFirstCircleSize(),
            height: getFirstCircleSize(),
            duration: period,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.08),
              shape: BoxShape.circle,
                border: Border.all(color: AppColors.white.withAlpha(25))
            ),
          ),
          Container(
            width: 112.w,
            height:112.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: Icon(
              Icons.bluetooth_sharp,
              size: 40,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  double getFourthCircleSize() {
    if (range < 4) {
      return 0;
    } else {
      return 360.w;
    }
  }

  double getThirdCircleSize() {
    if (range < 3) {
      return 0;
    } else {
      return 300.w;
    }
  }

  double getSecondCircleSize() {
    if (range < 2) {
      return 0;
    } else {
      return 240.w;
    }
  }

  double getFirstCircleSize() {
    if (range < 1) {
      return 0;
    } else {
      return 180.w;
    }
  }
}
