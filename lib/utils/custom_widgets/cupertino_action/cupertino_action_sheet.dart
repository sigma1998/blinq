// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/navigation_service.dart';

class MyCupertinoActionSheet extends StatelessWidget {
  //
  final List<Widget> actions;
  final String? title;

  const MyCupertinoActionSheet({
    super.key,
    required this.actions,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: const CupertinoThemeData(brightness: Brightness.dark),
      child: CupertinoActionSheet(
        actions: actions,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : null,
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          isDestructiveAction: false,
          onPressed: NavigationService.back,
          child: Text(
            'strCancel'.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
