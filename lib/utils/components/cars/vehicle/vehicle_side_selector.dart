import 'package:blinq/utils/components/cars/vehicle/vehicle_back_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_front_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_left_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_right_side.dart';
import 'package:blinq/utils/components/cars/vehicle/vehicle_top_side.dart';
import 'package:blinq/utils/states/vehicle_parts.dart';
import 'package:flutter/cupertino.dart';

class VehicleSideSelector extends StatelessWidget {
  final int index;
  final Function onPartPressed;
  final List<CarParts> parts;

  const VehicleSideSelector({
    super.key,
    required this.index,
    required this.onPartPressed,
    required this.parts,
  });

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return VehicleLeftSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    } else if (index == 1) {
      return VehicleRightSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    } else if (index == 2) {
      return VehicleTopSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    } else if (index == 3) {
      return VehicleFrontSideEditor(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    } else {
      return VehicleBackSide(
        onPartPressed: onPartPressed,
        parts: parts,
      );
    }
  }
}
