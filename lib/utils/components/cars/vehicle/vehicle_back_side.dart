import 'package:blinq/utils/components/buttons/rect_transparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';

class VehicleBackSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VehicleBackSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VehicleBackSide> createState() => _VehicleBackSideState();
}

class _VehicleBackSideState extends State<VehicleBackSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.back,
        ),
        if (widget.parts.contains(CarParts.backLeftHeadLight))
          SvgPicture.asset(
            AppDrawables.backLeftHeadLight,
          ),
        if (widget.parts.contains(CarParts.backRightHeadLight))
          SvgPicture.asset(
            AppDrawables.backRightHeadLight,
          ),
        if (widget.parts.contains(CarParts.backRearBumper))
          SvgPicture.asset(
            AppDrawables.backRearBumper,
          ),
        if (widget.parts.contains(CarParts.backRearWindow))
          SvgPicture.asset(
            AppDrawables.backRearWindow,
          ),
        Positioned(
          top: 50.h,
          child: RectTransparentButton(
            width: 200.w,
            height: 60.h,
            onTap: () {
              widget.onPartPressed(CarParts.backRearWindow);
            },
          ),
        ),
        Positioned(
          bottom: 90.h,
          child: RectTransparentButton(
            width: 280.w,
            height: 90.h,
            onTap: () {
              widget.onPartPressed(CarParts.backRearBumper);
            },
          ),
        ),
        Positioned(
          top: 110.h,
          left: 40.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.backLeftHeadLight);
            },
          ),
        ),
        Positioned(
          top: 110.h,
          right: 40.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.backRightHeadLight);
            },
          ),
        ),
      ],
    );
  }
}
