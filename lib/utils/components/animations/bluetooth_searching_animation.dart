import 'dart:async';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BluetoothSearchingAnimation extends StatefulWidget {
  final bool searching;

  const BluetoothSearchingAnimation({
    super.key,
    this.searching = true,
  });

  @override
  State<BluetoothSearchingAnimation> createState() =>
      _BluetoothSearchingAnimationState();
}

class _BluetoothSearchingAnimationState
    extends State<BluetoothSearchingAnimation> {
  int index = 0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        if (widget.searching) {
          if (index < 2) {
            index++;
          } else if (index == 2) {
            index = 0;
          } else {
            index = 0;
          }
        } else {
          index = 2;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icons[index],
          width: 86,
          height: 56,
        ),
        SizedBox(height: 36.h),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 40.h,
          child: Text(
            widget.searching ? 'Searching...' : '',
            style: AppTextStyles.s20W600,
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: widget.searching ? 100.h : 50.h,
        ),
      ],
    );
  }

  final List<String> icons = [
    AppDrawables.animFirst,
    AppDrawables.animSecond,
    AppDrawables.animThird,
  ];

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
