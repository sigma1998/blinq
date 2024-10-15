import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VanFrontSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VanFrontSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VanFrontSide> createState() => _VanFrontSideState();
}

class _VanFrontSideState extends State<VanFrontSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.vanFrontSide,
        ),
        if (widget.parts.contains(CarParts.vanFrontRightLight))
          SvgPicture.asset(
            AppDrawables.vanFrontRightLight,
          ),
        if (widget.parts.contains(CarParts.vanFrontLeftLight))
          SvgPicture.asset(
            AppDrawables.vanFrontLeftLight,
          ),
        if (widget.parts.contains(CarParts.vanFrontLeftMirror))
          SvgPicture.asset(
            AppDrawables.vanFrontLeftMirror,
          ),
        if (widget.parts.contains(CarParts.vanFrontRightMirror))
          SvgPicture.asset(
            AppDrawables.vanFrontRightMirror,
          ),
        if (widget.parts.contains(CarParts.vanFrontGrill))
          SvgPicture.asset(
            AppDrawables.vanFrontGrill,
          ),
        if (widget.parts.contains(CarParts.vanFrontBumper))
          SvgPicture.asset(
            AppDrawables.vanAeroBumper,
          ),
        if (widget.parts.contains(CarParts.vanFrontBumper))
          SvgPicture.asset(
            AppDrawables.vanAeroBumper2,
          ),
        Positioned(
          bottom: 30.h,
          child: RectTransparentButton(
            width: 200.w,
            height: 80.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanFrontBumper);
            },
          ),
        ),
        Positioned(
          right: 76.w,
          bottom: 90.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanFrontRightLight);
            },
          ),
        ),
        Positioned(
          left: 76.w,
          bottom: 90.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanFrontLeftLight);
            },
          ),
        ),
        Positioned(
          left: 46.w,
          top: 80.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanFrontLeftMirror);
            },
          ),
        ),
        Positioned(
          right: 46.w,
          top: 80.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanFrontRightMirror);
            },
          ),
        ),
        Positioned(
          bottom: 50.h,
          child: RectTransparentButton(
            width: 120.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanFrontGrill);
            },
          ),
        ),
      ],
    );
  }
}
