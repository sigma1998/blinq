// Flutter imports:
import 'package:flutter/material.dart';

class MyCheckbox extends StatelessWidget {
  //
  final bool isChecked;

  final void Function(bool?) onChanged;

  const MyCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 26,
      height: 26,
      child: Checkbox.adaptive(
        value: isChecked,
        onChanged: onChanged,
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        side: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        activeColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
