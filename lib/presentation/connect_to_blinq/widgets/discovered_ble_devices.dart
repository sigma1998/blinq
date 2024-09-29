import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/components/items/bluetooth_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';

class DiscoveredBleDevices extends StatefulWidget {
  final List<DiscoveredDevice> scannedBleDevices;
  final Function onTap;

  const DiscoveredBleDevices({
    super.key,
    required this.scannedBleDevices,
    required this.onTap,
  });

  @override
  State<DiscoveredBleDevices> createState() => _DiscoveredBleDevicesState();
}

class _DiscoveredBleDevicesState extends State<DiscoveredBleDevices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: Iterable.generate(widget.scannedBleDevices.length)
              .map<Widget>((e) {
            return GestureDetector(
              onTap: () {
                widget.onTap.call(widget.scannedBleDevices[e]);
              },
              child: BluetoothItem(
                name: widget.scannedBleDevices[e].name,
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 40.h),
        SvgPicture.asset(
          widget.scannedBleDevices.length == 1
              ? AppDrawables.one
              : widget.scannedBleDevices.length == 2
                  ? AppDrawables.two
                  : AppDrawables.three,
          height: 72.h,
        ),
      ],
    );
  }
}
