// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';

class InjuryItem extends StatelessWidget {
  //
  final String title;

  final void Function(bool) onChanged;

  const InjuryItem({
    super.key,
    required this.title,
    required this.onChanged,
  });

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        YesNoButton(
          onChanged: onChanged,
        ),
      ],
    );
  }
}
