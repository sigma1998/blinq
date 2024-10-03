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
          top: 110.h,
          right: 110.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 36.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightFrontWindow);
            },
          ),
        ),
        Positioned(
          top: 110.h,
          right: 190.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 36.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackWindow);
            },
          ),
        ),
        Positioned(
          bottom: 130.h,
          left: 90.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 56.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackDoor);
            },
          ),
        ),
        Positioned(
          bottom: 130.h,
          right: 100.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 56.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightFrontDoor);
            },
          ),
        ),
        Positioned(
          bottom: 114.h,
          left: 60.w,
          child: CircleTransparentButton(
            width: 50.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackTire);
            },
          ),
        ),
        Positioned(
          bottom: 114.h,
          right: 50.w,
          child: CircleTransparentButton(
            width: 50.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightFrontTire);
            },
          ),
        ),
        Positioned(
          bottom: 160.h,
          right: 40.w,
          child: RectTransparentButton(
            width: 70.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightRightWing);
            },
          ),
        ),
        Positioned(
          bottom: 160.h,
          left: 20.w,
          child: RectTransparentButton(
            width: 70.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightBackWing);
            },
          ),
        ),
      ],
    );
  }
}
