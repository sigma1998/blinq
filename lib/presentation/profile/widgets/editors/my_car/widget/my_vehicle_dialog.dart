
import 'package:flutter/cupertino.dart';

import '../../../../../../data/model/vehicle_info/brand/vehicle_info_dto.dart';
import '../../../../../../utils/custom_widgets/dialogs/default_dialog.dart';

class MyVehicleDialog extends StatelessWidget {
  final List<VehicleInfoDto> brands;

  const MyVehicleDialog({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      items: brands.map((e) => e.name ?? '').toList(),
    );
  }
}
