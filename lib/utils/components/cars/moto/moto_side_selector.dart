import 'package:blinq/utils/components/cars/moto/moto_front_side.dart';
import 'package:blinq/utils/components/cars/moto/moto_left_side.dart';
import 'package:flutter/cupertino.dart';

import '../../../states/vehicle_parts.dart';

class MotoSideSelector extends StatelessWidget {
  final int index;
  final Function onPartPressed;
  final List<CarParts> parts;

  const MotoSideSelector({
    super.key,
    required this.index,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return MotoFrontSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }
    return MotoLeftSide(
      onPartPressed: onPartPressed,
      parts: parts,
    );
  }
}
