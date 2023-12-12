// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/dialogs/cupertino_dialog.dart';

class PermissionDialog extends StatelessWidget {
  //
  final String title;

  const PermissionDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return MyCupertinoDialog(
      title: title,
      leftActionTitle: 'strSettings'.tr(),
      rightActionTitle: 'strCancel'.tr(),
      leftAction: () => openAppSettings(),
    );
  }
}
