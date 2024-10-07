import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VehicleTopSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VehicleTopSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VehicleTopSide> createState() => _VehicleTopSideState();
}

class _VehicleTopSideState extends State<VehicleTopSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.top,
        ),
        if (widget.parts.contains(CarParts.frontHood))
          SvgPicture.asset(
            AppDrawables.frontHood,
          ),
        if (widget.parts.contains(CarParts.rearWindow))
          SvgPicture.asset(
            AppDrawables.rearWindow,
          ),
        if (widget.parts.contains(CarParts.roof))
          SvgPicture.asset(
            AppDrawables.roof,
          ),
        if (widget.parts.contains(CarParts.windScreen))
          SvgPicture.asset(
            AppDrawables.windScreen,
          ),
        if (widget.parts.contains(CarParts.backWindScreen))
          SvgPicture.asset(
            AppDrawables.backWindScreen,
          ),
        Positioned(
          top: 0,
          child: RectTransparentButton(
            width: 120.w,
            height: 56.h,
            onTap: () {
              widget.onPartPressed(CarParts.frontHood);
            },
          ),
        ),
        Positioned(
          top: 57.h,
          child: RectTransparentButton(
            width: 120.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.windScreen);
            },
          ),
        ),
        Positioned(
          top: 100.h,
          child: RectTransparentButton(
            width: 120.w,
            height: 86.h,
            onTap: () {
              widget.onPartPressed(CarParts.roof);
            },
          ),
        ),
        Positioned(
          bottom: 20.h,
          child: RectTransparentButton(
            width: 120.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.backWindScreen);
            },
          ),
        ),
        Positioned(
          bottom: 0.h,
          child: RectTransparentButton(
            width: 120.w,
            height: 16.h,
            onTap: () {
              widget.onPartPressed(CarParts.rearWindow);
            },
          ),
        ),
      ],
    );
  }
}
