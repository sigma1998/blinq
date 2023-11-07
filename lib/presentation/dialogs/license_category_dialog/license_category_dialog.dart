// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/utils/custom_widgets/dialogs/default_dialog.dart';

class LicenseCategoryDialog extends StatelessWidget {
  //
  const LicenseCategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDialog(
      items: DriverLicenseType.values.map((e) => e.name).toList(),
    );
  }
}
