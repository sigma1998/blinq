import 'package:blinq/utils/components/cars/van/van_back_side.dart';
import 'package:blinq/utils/components/cars/van/van_front_side.dart';
import 'package:blinq/utils/components/cars/van/van_left_side.dart';
import 'package:blinq/utils/components/cars/van/van_right_side.dart';
import 'package:blinq/utils/components/cars/van/van_top_side.dart';
import 'package:flutter/cupertino.dart';

import '../../../states/vehicle_parts.dart';

class VanSideSelector extends StatelessWidget {
  final int index;
  final Function onPartPressed;
  final List<CarParts> parts;

  const VanSideSelector({
    super.key,
    required this.index,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      ///FRONT
      return VanFrontSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }
    if (index == 1) {
      ///LEFT
      return VanLeftSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }
    if (index == 2) {
      ///RIGHT
      return VanRightSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }
    if (index == 3) {
      ///TOP
      return VanTopSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }
    if (index == 4) {
      ///Back
      return VanBackSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }

    ///TOP
    return VanTopSide(
      onPartPressed: onPartPressed,
      parts: parts,
    );
  }
}
