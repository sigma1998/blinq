// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/dialogs/default_dialog.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';

class VehicleTypeDialog extends StatelessWidget {
  //
  const VehicleTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      items: VehicleType.values.map((e) => e.name).toList(),
    );
  }
}
