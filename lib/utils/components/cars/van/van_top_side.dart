import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/drawables/app_drawables.dart';
import '../../../states/vehicle_parts.dart';
import '../../buttons/rect_transparent_button.dart';

class VanTopSide extends StatefulWidget {
  final Function onPartPressed;
  final List<CarParts> parts;

  const VanTopSide({
    super.key,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  State<VanTopSide> createState() => _VanTopSideState();
}

class _VanTopSideState extends State<VanTopSide> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppDrawables.vanTopSide,
        ),
        if (widget.parts.contains(CarParts.vanRoof))
          SvgPicture.asset(
            AppDrawables.vanRoof,
          ),
        if (widget.parts.contains(CarParts.vanBonnet))
          SvgPicture.asset(
            AppDrawables.vanBonnet,
          ),
        if (widget.parts.contains(CarParts.vanWindScreen))
          SvgPicture.asset(
            AppDrawables.vanWindScreen,
          ),
        Positioned(
          bottom: 0.h,
          child: RectTransparentButton(
            width: 80.w,
            height: 170.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanRoof);
            },
          ),
        ),
        Positioned(
          bottom: 170.h,
          child: RectTransparentButton(
            width: 80.w,
            height: 44.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanWindScreen);
            },
          ),
        ),
        Positioned(
          top: 0,
          child: RectTransparentButton(
            width: 80.w,
            height: 30  .h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBonnet);
            },
          ),
        ),

      ],
    );
  }
}
