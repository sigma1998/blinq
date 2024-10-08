import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularBluetoothItem extends StatefulWidget {
  final DiscoveredDevice? device;
  final VoidCallback onTap;
  final int type;

  const CircularBluetoothItem({
    super.key,
    required this.type,
    this.device,
    required this.onTap,
  });

  @override
  State<CircularBluetoothItem> createState() => _CircularBluetoothItemState();
}

class _CircularBluetoothItemState extends State<CircularBluetoothItem> {
  bool opened = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        opened = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top[widget.type].h,
      left: left[widget.type].w,
      child: AnimatedOpacity(
        opacity: opened ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Column(
            children: [
              Container(
                width: sizes[widget.type],
                height: sizes[widget.type],
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: SvgPicture.asset(
                  AppDrawables.bluetoothIcon,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: sizes[widget.type],
                child: Text(
                  widget.device?.name ?? '',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.s13W400.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<double> top = [
    40,
    80,
    300,
  ];
  final List<double> left = [
    40,
    200,
    20,
  ];

  final List<double> sizes = [
    80,
    60,
    120,
  ];
}
