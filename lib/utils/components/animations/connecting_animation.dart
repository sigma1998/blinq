import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class ConnectingAnimation extends StatefulWidget {
  const ConnectingAnimation({super.key});

  @override
  State<ConnectingAnimation> createState() => _ConnectingAnimationState();
}

class _ConnectingAnimationState extends State<ConnectingAnimation> {
  bool opened = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        opened = !opened;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 72.h,
      decoration: BoxDecoration(
        color: AppColors.grey2,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: opened
                ? const Duration(milliseconds: 400)
                : const Duration(milliseconds: 0),
            height: opened ? 0 : 60.h,
          ),
          Container(
            width: 4,
            height: 12.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
