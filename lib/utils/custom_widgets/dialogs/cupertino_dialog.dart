// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/navigation_service.dart';

class MyCupertinoDialog extends StatelessWidget {
  //
  final String title;

  final String? leftActionTitle;
  final String? rightActionTitle;

  const MyCupertinoDialog({
    super.key,
    required this.title,
    //
    this.leftActionTitle,
    this.rightActionTitle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(
            leftActionTitle ?? 'strNo'.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onPressed: () =>
              NavigationService.back(result: leftActionTitle ?? 'strNo'.tr()),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text(
            rightActionTitle ?? 'strYes'.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onPressed: () =>
              NavigationService.back(result: leftActionTitle ?? 'strYes'.tr()),
        ),
      ],
    );
  }
}
