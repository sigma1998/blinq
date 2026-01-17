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
  State<CircularBluetoothSearchingAnimation> createState() =>
      _CircularBluetoothSearchingAnimationState();
}

class _CircularBluetoothSearchingAnimationState
    extends State<CircularBluetoothSearchingAnimation> {
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
              if (range >= 4) {
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
      width: 312.w,
      height: 312.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            width: getBiggestCircleSize(),
            height: getBiggestCircleSize(),
            duration: period,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          AnimatedContainer(
            width: getMiddleCircleSize(),
            height: getMiddleCircleSize(),
            duration: period,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          AnimatedContainer(
            width: getSmallestCircleSize(),
            height: getSmallestCircleSize(),
            duration: period,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            width: 72.w,
            height: 72.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.scanning ? AppColors.white : AppColors.darkGrey,
            ),
            child: Icon(
              Icons.bluetooth_sharp,
              size: 34,
              color: widget.scanning ? AppColors.primaryColor : AppColors.grey2,
            ),
          ),
        ],
      ),
    );
  }

  double getBiggestCircleSize() {
    return size.w * range;
  }

  double getMiddleCircleSize() {
    if (range <= 2) {
      return size.w * range;
    } else {
      return size.w * 2;
    }
  }

  double getSmallestCircleSize() {
    if (range <= 1) {
      return size.w * range;
    } else {
      return size.w;
    }
  }
}
