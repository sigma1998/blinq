import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/components/buttons/rect_transparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../states/vehicle_parts.dart';

class VehicleFrontSideEditor extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VehicleFrontSideEditor({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VehicleFrontSideEditor> createState() => _VehicleFrontSideEditorState();
}

class _VehicleFrontSideEditorState extends State<VehicleFrontSideEditor> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.front,
        ),
        if (widget.parts.contains(CarParts.hood))
          SvgPicture.asset(
            AppDrawables.hood,
          ),
        if (widget.parts.contains(CarParts.leftMirror))
          SvgPicture.asset(
            AppDrawables.leftMirror,
          ),
        if (widget.parts.contains(CarParts.rightMirror))
          SvgPicture.asset(
            AppDrawables.rightMirror,
          ),
        if (widget.parts.contains(CarParts.frontBumpers))
          SvgPicture.asset(
            AppDrawables.frontBumpers,
          ),
        Positioned(
          bottom: 60.h,
          child: RectTransparentButton(
            width: 240.w,
            height: 76.h,
            onTap: () {
              widget.onPartPressed(CarParts.frontBumpers);
            },
          ),
        ),
        Positioned(
          bottom: 136.h,
          child: RectTransparentButton(
            width: 200.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.hood);
            },
          ),
        ),
        Positioned(
          right: 50.w,
          top: 64.h,
          child: RectTransparentButton(
            width: 40.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.rightMirror);
            },
          ),
        ),
        Positioned(
          left: 50.w,
          top: 64.h,
          child: RectTransparentButton(
            width: 40.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.leftMirror);
            },
          ),
        ),
      ],
    );
  }
}
