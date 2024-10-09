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
        if (widget.parts.contains(CarParts.vanWindScreen))
          SvgPicture.asset(
            AppDrawables.vanWindScreen,
          ),
        Positioned(
          top: 0,
          child: RectTransparentButton(
            width: 80.w,
            height: 30.h,
            onTap: () {
              widget.onPartPressed(CarParts.vanBonnet);
            },
          ),
        ),
      ],
    );
  }
}
