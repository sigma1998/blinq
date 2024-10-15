import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class MotoFrontSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const MotoFrontSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<MotoFrontSide> createState() => _MotoFrontSideState();
}

class _MotoFrontSideState extends State<MotoFrontSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.motoFrondSide,
        ),
        if (widget.parts.contains(CarParts.motoLeftViewMirror))
          SvgPicture.asset(
            AppDrawables.motoLeftViewMirror,
          ),
        if (widget.parts.contains(CarParts.motoRightViewMirror))
          SvgPicture.asset(
            AppDrawables.motoRightViewMirror,
          ),
        if (widget.parts.contains(CarParts.motoRightHandClutch))
          SvgPicture.asset(
            AppDrawables.motoRightHandClutch,
          ),
        if (widget.parts.contains(CarParts.motoLeftHandClutch))
          SvgPicture.asset(
            AppDrawables.motoLeftHandClutch,
          ),
        if (widget.parts.contains(CarParts.motoHeadLight))
          SvgPicture.asset(
            AppDrawables.motoHeadLight,
          ),
        if (widget.parts.contains(CarParts.motoWindScreen))
          SvgPicture.asset(
            AppDrawables.motoWindScreen,
          ),
        if (widget.parts.contains(CarParts.motoWindShield))
          SvgPicture.asset(
            AppDrawables.motoWindShield,
          ),
        Positioned(
          left: 100.h,
          top: 0.h,
          child: RectTransparentButton(
            width: 40.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoLeftViewMirror);
            },
          ),
        ),
        Positioned(
          right: 100.h,
          top: 0.h,
          child: RectTransparentButton(
            width: 40.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoRightViewMirror);
            },
          ),
        ),
        Positioned(
          right: 100.h,
          top: 30.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoRightHandClutch);
            },
          ),
        ),
        Positioned(
          left: 100.h,
          top: 30.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoLeftHandClutch);
            },
          ),
        ),
        Positioned(
          top: 64.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoHeadLight);
            },
          ),
        ),
        Positioned(
          top: 0,
          child: RectTransparentButton(
            width: 60.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoWindScreen);
            },
          ),
        ),
        Positioned(
          top: 42.h,
          child: RectTransparentButton(
            width: 60.w,
            height: 22.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoWindShield);
            },
          ),
        ),
      ],
    );
  }
}
