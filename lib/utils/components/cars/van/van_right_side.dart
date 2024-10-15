import 'package:blinq/utils/components/buttons/circle_tranparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VanRightSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VanRightSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VanRightSide> createState() => _VanRightSideState();
}

class _VanRightSideState extends State<VanRightSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.vanRightSide,
        ),
        if (widget.parts.contains(CarParts.vanRightFrontRightWindow))
          SvgPicture.asset(
            AppDrawables.vanRightFrontRightWindow,
          ),
        if (widget.parts.contains(CarParts.vanRightMiddleRightWindow))
          SvgPicture.asset(
            AppDrawables.vanRightMiddleRightWindow,
          ),
        if (widget.parts.contains(CarParts.vanRightRearRightWindow))
          SvgPicture.asset(
            AppDrawables.vanRightRearRightWindow,
          ),
        if (widget.parts.contains(CarParts.vanRightFrontRightWing))
          SvgPicture.asset(
            AppDrawables.vanRightFrontRightWing,
          ),
        if (widget.parts.contains(CarParts.vanRightFrontRightDoor))
          SvgPicture.asset(
            AppDrawables.vanRightFrontRightDoor,
          ),
        if (widget.parts.contains(CarParts.vanRightRearRightDoor))
          SvgPicture.asset(
            AppDrawables.vanRightRearRightDoor,
          ),
        if (widget.parts.contains(CarParts.vanRightRearRightWing))
          SvgPicture.asset(
            AppDrawables.vanRightRearRightWing,
          ),
        if (widget.parts.contains(CarParts.vanRightRearRightTire))
          SvgPicture.asset(
            AppDrawables.vanRightRearRightTire,
          ),
        if (widget.parts.contains(CarParts.vanRightFrontRightTire))
          SvgPicture.asset(
            AppDrawables.vanRightFrontRightTire,
          ),
        Positioned(
          top: 80.h,
          right: 80.w,
          child: RectTransparentButton(
            width: 80.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightFrontRightWindow);
            },
          ),
        ),
        Positioned(
          top: 80.h,
          right: 160.w,
          child: RectTransparentButton(
            width: 56.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightMiddleRightWindow);
            },
          ),
        ),
        Positioned(
          top: 80.h,
          left: 60.w,
          child: RectTransparentButton(
            width: 76.w,
            height: 36.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightRearRightWindow);
            },
          ),
        ),
        Positioned(
          top: 120.h,
          right: 70.w,
          child: RectTransparentButton(
            width: 40.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightFrontRightWing);
            },
          ),
        ),
        Positioned(
          top: 120.h,
          right: 110.w,
          child: RectTransparentButton(
            width: 50.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightFrontRightDoor);
            },
          ),
        ),
        Positioned(
          top: 120.h,
          right: 160.w,
          child: RectTransparentButton(
            width: 56.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightRearRightDoor);
            },
          ),
        ),
        Positioned(
          top: 110.h,
          left: 70.w,
          child: RectTransparentButton(
            width: 66.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRightRearRightWing);
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
              widget.onPartPressed(CarParts.vanRightRearRightTire);
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
              widget.onPartPressed(CarParts.vanRightFrontRightTire);
            },
          ),
        ),
      ],
    );
  }
}
