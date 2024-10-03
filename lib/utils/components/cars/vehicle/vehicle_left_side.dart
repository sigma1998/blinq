import 'package:blinq/utils/components/buttons/circle_tranparent_button.dart';
import 'package:blinq/utils/components/buttons/rect_transparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';

class VehicleLeftSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VehicleLeftSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VehicleLeftSide> createState() => _VehicleLeftSideState();
}

class _VehicleLeftSideState extends State<VehicleLeftSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.left,
        ),
        if (widget.parts.contains(CarParts.leftLeftTire))
          SvgPicture.asset(
            AppDrawables.leftLeftTire,
          ),
        if (widget.parts.contains(CarParts.leftLeftWindow))
          SvgPicture.asset(
            AppDrawables.leftLeftWindow,
          ),
        if (widget.parts.contains(CarParts.leftLeftWing))
          SvgPicture.asset(
            AppDrawables.leftLeftWing,
          ),
        if (widget.parts.contains(CarParts.leftLeftDoor))
          SvgPicture.asset(
            AppDrawables.leftLeftDoor,
          ),
        if (widget.parts.contains(CarParts.leftRightDoor))
          SvgPicture.asset(
            AppDrawables.leftRightDoor,
          ),
        if (widget.parts.contains(CarParts.leftRightWindow))
          SvgPicture.asset(
            AppDrawables.leftRightWindow,
          ),
        if (widget.parts.contains(CarParts.leftRearLeftWing))
          SvgPicture.asset(
            AppDrawables.leftRearLeftWing,
          ),
        if (widget.parts.contains(CarParts.leftRightTire))
          SvgPicture.asset(
            AppDrawables.leftRightTire,
          ),
        Positioned(
          bottom: 115.h,
          left: 52.w,
          child: CircleTransparentButton(
            width: 44.w,
            height: 44.w,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftTire);
            },
          ),
        ),
        Positioned(
          bottom: 115.h,
          right: 60.w,
          child: CircleTransparentButton(
            width: 44.w,
            height: 44.w,
            onTap: () {
              widget.onPartPressed(CarParts.leftRightTire);
            },
          ),
        ),
        Positioned(
          top: 124.h,
          right: 20.w,
          child: RectTransparentButton(
            width: 74.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftRearLeftWing);
            },
          ),
        ),
        Positioned(
          top: 104.h,
          right: 100.w,
          child: RectTransparentButton(
            width: 64.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftRightWindow);
            },
          ),
        ),
        Positioned(
          top: 104.h,
          right: 164.w,
          child: RectTransparentButton(
            width: 74.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftWindow);
            },
          ),
        ),
        Positioned(
          bottom: 130.h,
          right: 164.w,
          child: RectTransparentButton(
            width: 74.w,
            height: 54.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftDoor);
            },
          ),
        ),
        Positioned(
          bottom: 130.h,
          right: 100.w,
          child: RectTransparentButton(
            width: 64.w,
            height: 54.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftRightDoor);
            },
          ),
        ),
        Positioned(
          top: 130.h,
          left: 36.w,
          child: RectTransparentButton(
            width: 74.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftWing);
            },
          ),
        ),
      ],
    );
  }
}
