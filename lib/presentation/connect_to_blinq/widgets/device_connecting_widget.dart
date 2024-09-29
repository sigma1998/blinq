import 'dart:async';

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/items/bluetooth_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceConnectingWidget extends StatefulWidget {
  final DiscoveredDevice? device;

  const DeviceConnectingWidget({super.key, required this.device});

  @override
  State<DeviceConnectingWidget> createState() => _DeviceConnectingWidgetState();
}

class _DeviceConnectingWidgetState extends State<DeviceConnectingWidget> {
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
    return Column(
      children: [
        SizedBox(height: 50.h),
        BluetoothItem(name: widget.device?.name),
        SizedBox(height: 40.h),
        Container(
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
        ),
        SizedBox(height: 40.h),
        SvgPicture.asset(AppDrawables.connecting),
      ],
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
