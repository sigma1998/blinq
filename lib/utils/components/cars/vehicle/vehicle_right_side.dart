import 'package:blinq/utils/components/buttons/circle_tranparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VehicleRightSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VehicleRightSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VehicleRightSide> createState() => _VehicleRightSideState();
}

class _VehicleRightSideState extends State<VehicleRightSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.rightSide,
        ),
        if (widget.parts.contains(CarParts.rightBackDoor))
          SvgPicture.asset(
            AppDrawables.rightBackDoor,
          ),
        if (widget.parts.contains(CarParts.rightBackTire))
          SvgPicture.asset(
            AppDrawables.rightBackTire,
          ),
        if (widget.parts.contains(CarParts.rightBackWindow))
          SvgPicture.asset(
            AppDrawables.rightBackWindow,
          ),
        if (widget.parts.contains(CarParts.rightBackWing))
          SvgPicture.asset(
            AppDrawables.rightBackWing,
          ),
        if (widget.parts.contains(CarParts.rightFrontDoor))
          SvgPicture.asset(
            AppDrawables.rightFrontDoor,
          ),
        if (widget.parts.contains(CarParts.rightFrontTire))
          SvgPicture.asset(
            AppDrawables.rightFrontTire,
          ),
        if (widget.parts.contains(CarParts.rightFrontWindow))
          SvgPicture.asset(
            AppDrawables.rightFrontWindow,
          ),
        if (widget.parts.contains(CarParts.rightRightWing))
          SvgPicture.asset(
            AppDrawables.rightRightWing,
          ),
        Positioned(
          top: 70.h,
          right: 120.w,
          child: RectTransparentButton(
            width: 66.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightFrontWindow);
            },
          ),
        ),
        Positioned(
          top: 70.h,
          right: 184.w,
          child: RectTransparentButton(
            width: 60.w,
            height: 36.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackWindow);
            },
          ),
        ),
        Positioned(
          bottom: 90.h,
          left: 110.w,
          child: RectTransparentButton(
            width: 60.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackDoor);
            },
          ),
        ),
        Positioned(
          bottom: 90.h,
          right: 120.w,
          child: RectTransparentButton(
            width: 60.w,
            height: 56.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightFrontDoor);
            },
          ),
        ),
        Positioned(
          bottom: 100.h,
          right: 50.w,
          child: RectTransparentButton(
            width: 74.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightRightWing);
            },
          ),
        ),
        Positioned(
          bottom: 120.h,
          left: 40.w,
          child: RectTransparentButton(
            width: 76.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackWing);
            },
          ),
        ),
        Positioned(
          bottom: 84.h,
          left: 90.w,
          child: CircleTransparentButton(
            width: 34.w,
            height: 34.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackTire);
            },
          ),
        ),
        Positioned(
          bottom: 84.h,
          right: 84.w,
          child: CircleTransparentButton(
            width: 34.w,
            height: 34.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightFrontTire);
            },
          ),
        ),
      ],
    );
  }
}
