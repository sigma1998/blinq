import 'package:blinq/utils/components/buttons/circle_tranparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VanLeftSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VanLeftSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VanLeftSide> createState() => _VanLeftSideState();
}

class _VanLeftSideState extends State<VanLeftSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.vanLeftSide,
        ),
        if (widget.parts.contains(CarParts.vanLeftFrontLeftWindow))
          SvgPicture.asset(
            AppDrawables.vanLeftFrontLeftWindow,
          ),
        if (widget.parts.contains(CarParts.vanLeftFrontLeftWing))
          SvgPicture.asset(
            AppDrawables.vanLeftFrontLeftWing,
          ),
        if (widget.parts.contains(CarParts.vanLeftMiddleLeftWindow))
          SvgPicture.asset(
            AppDrawables.vanLeftMiddleLeftWindow,
          ),
        if (widget.parts.contains(CarParts.vanLeftRearLeftWindow))
          SvgPicture.asset(
            AppDrawables.vanLeftRearLeftWindow,
          ),
        if (widget.parts.contains(CarParts.vanLeftFrontLeftDoor))
          SvgPicture.asset(
            AppDrawables.vanLeftFrontLeftDoor,
          ),
        if (widget.parts.contains(CarParts.vanLeftRearLeftDoor))
          SvgPicture.asset(
            AppDrawables.vanLeftRearLeftDoor,
          ),
        if (widget.parts.contains(CarParts.vanLeftRearLeftWing))
          SvgPicture.asset(
            AppDrawables.vanLeftRearLeftWing,
          ),
        if (widget.parts.contains(CarParts.vanLeftLeftTire))
          SvgPicture.asset(
            AppDrawables.vanLeftLeftTire,
          ),
        if (widget.parts.contains(CarParts.vanLeftRightTire))
          SvgPicture.asset(
            AppDrawables.vanLeftRightTire,
          ),
        Positioned(
          top: 70.h,
          left: 80.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftFrontLeftWindow);
            },
          ),
        ),
        Positioned(
          bottom: 96.h,
          left: 70.w,
          child: RectTransparentButton(
            width: 40.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftFrontLeftWing);
            },
          ),
        ),
        Positioned(
          top: 76.h,
          right: 130.w,
          child: RectTransparentButton(
            width: 60.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftMiddleLeftWindow);
            },
          ),
        ),
        Positioned(
          top: 76.h,
          right: 60.w,
          child: RectTransparentButton(
            width: 70.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftRearLeftWindow);
            },
          ),
        ),
        Positioned(
          bottom: 80.h,
          left: 110.w,
          child: RectTransparentButton(
            width: 50.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftFrontLeftDoor);
            },
          ),
        ),
        Positioned(
          bottom: 80.h,
          left: 160.w,
          child: RectTransparentButton(
            width: 56.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftRearLeftDoor);
            },
          ),
        ),
        Positioned(
          bottom: 80.h,
          right: 60.w,
          child: RectTransparentButton(
            width: 76.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftRearLeftWing);
            },
          ),
        ),
        Positioned(
          bottom: 64.h,
          left: 82.w,
          child: CircleTransparentButton(
            width: 40.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftLeftTire);
            },
          ),
        ),
        Positioned(
          bottom: 64.h,
          right: 82.w,
          child: CircleTransparentButton(
            width: 40.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanLeftRightTire);
            },
          ),
        ),
      ],
    );
  }
}
