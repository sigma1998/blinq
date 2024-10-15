import 'package:blinq/utils/components/buttons/circle_tranparent_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class MotoLeftSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const MotoLeftSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<MotoLeftSide> createState() => _MotoLeftSideState();
}

class _MotoLeftSideState extends State<MotoLeftSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.motoLeftSide,
        ),
        if (widget.parts.contains(CarParts.motoFrontTire))
          SvgPicture.asset(
            AppDrawables.motoFrontTire,
          ),
        if (widget.parts.contains(CarParts.motoRareTire))
          SvgPicture.asset(
            AppDrawables.motoRareTire,
          ),
        if (widget.parts.contains(CarParts.motoFrontFork))
          SvgPicture.asset(
            AppDrawables.motoFrontFork,
          ),
        if (widget.parts.contains(CarParts.motoFrontFender))
          SvgPicture.asset(
            AppDrawables.motoFrontFender,
          ),
        if (widget.parts.contains(CarParts.motoFuelTank))
          SvgPicture.asset(
            AppDrawables.motoFuelTank,
          ),
        if (widget.parts.contains(CarParts.motoSeat))
          SvgPicture.asset(
            AppDrawables.motoSeat,
          ),
        if (widget.parts.contains(CarParts.motoRareFender))
          SvgPicture.asset(
            AppDrawables.motoRareFender,
          ),
        if (widget.parts.contains(CarParts.motoStopLight))
          SvgPicture.asset(
            AppDrawables.motoStopLight,
          ),
        if (widget.parts.contains(CarParts.motoHorn))
          SvgPicture.asset(
            AppDrawables.motoHorn,
          ),
        if (widget.parts.contains(CarParts.motoEngine))
          SvgPicture.asset(
            AppDrawables.motoEngine,
          ),
        if (widget.parts.contains(CarParts.motoRareFork))
          SvgPicture.asset(
            AppDrawables.motoRareFork,
          ),
        if (widget.parts.contains(CarParts.motoTransmission))
          SvgPicture.asset(
            AppDrawables.motoTransmission,
          ),
        if (widget.parts.contains(CarParts.motoExhaustSystem))
          SvgPicture.asset(
            AppDrawables.motoExhaustSystem,
          ),
        Positioned(
          left: 54.w,
          bottom: 54.h,
          child: CircleTransparentButton(
            width: 70.w,
            height: 70.w,
            onTap: () {
              widget.onPartPressed(CarParts.motoFrontTire);
            },
          ),
        ),
        Positioned(
          right: 62.w,
          bottom: 54.h,
          child: CircleTransparentButton(
            width: 70.w,
            height: 70.w,
            onTap: () {
              widget.onPartPressed(CarParts.motoRareTire);
            },
          ),
        ),
        Positioned(
          left: 94.w,
          top: 84.h,
          child: Transform.rotate(
            angle: 2,
            child: RectTransparentButton(
              width: 26.w,
              height: 70.w,
              onTap: () {
                widget.onPartPressed(CarParts.motoFrontFender);
              },
            ),
          ),
        ),
        Positioned(
          left: 106.w,
          top: 54.h,
          child: Transform.rotate(
            angle: 0.4,
            child: RectTransparentButton(
              width: 20.w,
              height: 90.w,
              onTap: () {
                widget.onPartPressed(CarParts.motoFrontFork);
              },
            ),
          ),
        ),
        Positioned(
          left: 134.w,
          top: 64.h,
          child: RectTransparentButton(
            width: 60.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoFuelTank);
            },
          ),
        ),
        Positioned(
          left: 194.w,
          top: 64.h,
          child: RectTransparentButton(
            width: 60.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoSeat);
            },
          ),
        ),
        Positioned(
          right: 54.w,
          top: 84.h,
          child: RectTransparentButton(
            width: 60.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoRareFender);
            },
          ),
        ),
        Positioned(
          right: 54.w,
          top: 84.h,
          child: RectTransparentButton(
            width: 30.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoStopLight);
            },
          ),
        ),
        Positioned(
          left: 144.w,
          top: 98.h,
          child: RectTransparentButton(
            width: 46.w,
            height: 36.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoHorn);
            },
          ),
        ),
        Positioned(
          left: 188.w,
          top: 98.h,
          child: RectTransparentButton(
            width: 46.w,
            height: 36.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoEngine);
            },
          ),
        ),
        Positioned(
          right: 100.w,
          top: 110.h,
          child: Transform.rotate(
            angle: 2.6,
            child: RectTransparentButton(
              width: 20.w,
              height: 46.h,
              onTap: () {
                widget.onPartPressed(CarParts.motoRareFork);
              },
            ),
          ),
        ),
        Positioned(
          bottom: 60.h,
          child: RectTransparentButton(
            width: 50.w,
            height: 50.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoTransmission);
            },
          ),
        ),
        Positioned(
          right: 120.w,
          bottom: 60.h,
          child: RectTransparentButton(
            width: 30.w,
            height: 40.h,
            onTap: () {
              widget.onPartPressed(CarParts.motoExhaustSystem);
            },
          ),
        ),
      ],
    );
  }
}
