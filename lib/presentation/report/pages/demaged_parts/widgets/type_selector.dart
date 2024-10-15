import 'package:blinq/utils/components/cars/moto/moto_side_selector.dart';
import 'package:blinq/utils/components/cars/van/van_side_selector.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../data/model/car/vehicle_type/vehicle_type.dart';
import '../../../../../utils/components/cars/vehicle/vehicle_side_selector.dart';
import '../../../../../utils/states/vehicle_parts.dart';

class TypeSelector extends StatelessWidget {
  final VehicleType type;
  final int index;
  final Function onPartPressed;
  final List<CarParts> parts;

  const TypeSelector({
    super.key,
    required this.index,
    required this.onPartPressed,
    required this.parts,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    ///VAN
    if (type == VehicleType.van) {
      return VanSideSelector(
        onPartPressed: onPartPressed,
        index: index,
        parts: parts,
      );
    }

    ///MOTO
    if (type == VehicleType.moto) {
      return MotoSideSelector(
        onPartPressed: onPartPressed,
        index: index,
        parts: parts,
      );
    }

    ///CAR
    return VehicleSideSelector(
      onPartPressed: onPartPressed,
      index: index,
      parts: parts,
    );
  }
}
