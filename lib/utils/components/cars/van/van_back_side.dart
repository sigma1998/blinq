import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VanBackSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VanBackSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VanBackSide> createState() => _VanBackSideState();
}

class _VanBackSideState extends State<VanBackSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.vanBackSide,
        ),
        if (widget.parts.contains(CarParts.vanBackRearWindow))
          SvgPicture.asset(
            AppDrawables.vanBackRearWindow,
          ),
        if (widget.parts.contains(CarParts.vanBackCargoDoorRight))
          SvgPicture.asset(
            AppDrawables.vanBackCargoDoorRight,
          ),
        if (widget.parts.contains(CarParts.vanBackCargoLeftDoor))
          SvgPicture.asset(
            AppDrawables.vanBackCargoLeftDoor,
          ),
        if (widget.parts.contains(CarParts.vanBackRearLeftHeadLight))
          SvgPicture.asset(
            AppDrawables.vanBackRearLeftHeadLight,
          ),
        if (widget.parts.contains(CarParts.vanBackRearRightHeadLight))
          SvgPicture.asset(
            AppDrawables.vanBackRearRightHeadLight,
          ),
        Positioned(
          top: 40.h,
          child: RectTransparentButton(
            width: 140.w,
            height: 70.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBackRearWindow);
            },
          ),
        ),
        Positioned(
          right: 100.h,
          top: 110.h,
          child: RectTransparentButton(
            width: 80.w,
            height: 90.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBackCargoDoorRight);
            },
          ),
        ),
        Positioned(
          left: 100.h,
          top: 110.h,
          child: RectTransparentButton(
            width: 80.w,
            height: 90.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBackCargoLeftDoor);
            },
          ),
        ),
        Positioned(
          left: 80.h,
          top: 60.h,
          child: RectTransparentButton(
            width: 30.w,
            height: 100.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBackRearLeftHeadLight);
            },
          ),
        ),
        Positioned(
          right: 80.h,
          top: 60.h,
          child: RectTransparentButton(
            width: 30.w,
            height: 100.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBackRearRightHeadLight);
            },
          ),
        ),
      ],
    );
  }
}
