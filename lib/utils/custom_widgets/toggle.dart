// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyToggle extends StatelessWidget {
  //
  final bool isActive;

  final void Function(bool) onChanged;

  const MyToggle({
    super.key,
    required this.isActive,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isActive,
      onChanged: onChanged,
      key: ValueKey(isActive),
      thumbColor: Theme.of(context).colorScheme.primary,
      activeColor: Theme.of(context).colorScheme.outline,
    );
  }
}
