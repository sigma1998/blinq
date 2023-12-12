// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/custom_widgets/dialogs/cupertino_dialog.dart';

class PermissionDialog extends StatelessWidget {
  //
  final String title;
  final VoidCallback? onSettingsPressed;

  const PermissionDialog({
    super.key,
    required this.title,
    this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MyCupertinoDialog(
      title: title,
      rightActionTitle: 'strSettings'.tr(),
      rightAction: () {
        NavigationService.back();
        if (onSettingsPressed != null) onSettingsPressed!();
        openAppSettings();
      },
      //
      leftActionTitle: 'strCancel'.tr(),
      leftAction: NavigationService.back,
    );
  }
}
