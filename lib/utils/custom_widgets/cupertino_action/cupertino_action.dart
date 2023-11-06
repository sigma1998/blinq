// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoActionSheetAction extends StatelessWidget {
  //
  final String label;
  final void Function() onPressed;

  const MyCupertinoActionSheetAction({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheetAction(
      onPressed: onPressed,
      isDefaultAction: true,
      isDestructiveAction: false,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
