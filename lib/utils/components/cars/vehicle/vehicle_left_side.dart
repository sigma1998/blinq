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
          top: 84.h,
          right: 60.w,
          child: RectTransparentButton(
            width: 54.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftRearLeftWing);
            },
          ),
        ),
        Positioned(
          top: 74.h,
          right: 104.w,
          child: RectTransparentButton(
            width: 60.w,
            height: 34.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftRightWindow);
            },
          ),
        ),
        Positioned(
          top: 74.h,
          right: 164.w,
          child: RectTransparentButton(
            width: 70.w,
            height: 34.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftWindow);
            },
          ),
        ),
        Positioned(
          bottom: 90.h,
          right: 164.w,
          child: RectTransparentButton(
            width: 64.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftDoor);
            },
          ),
        ),
        Positioned(
          bottom: 90.h,
          right: 110.w,
          child: RectTransparentButton(
            width: 54.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftRightDoor);
            },
          ),
        ),
        Positioned(
          top: 100.h,
          left: 66.w,
          child: RectTransparentButton(
            width: 54.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftWing);
            },
          ),
        ),
        Positioned(
          bottom: 84.h,
          left: 82.w,
          child: CircleTransparentButton(
            width: 34.w,
            height: 34.w,
            onTap: () {
              widget.onPartPressed(CarParts.leftLeftTire);
            },
          ),
        ),
        Positioned(
          bottom: 84.h,
          right: 90.w,
          child: CircleTransparentButton(
            width: 34.w,
            height: 34.w,
            onTap: () {
              widget.onPartPressed(CarParts.leftRightTire);
            },
          ),
        ),
      ],
    );
  }
}
