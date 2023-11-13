// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'option_button.dart';

class InjuryItem extends StatelessWidget {
  //
  final String title;
  final bool isPositive;

  const InjuryItem({
    super.key,
    required this.title,
    required this.isPositive,
  });

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
        Row(
          children: [
            InjuryOptionButton.no(
              isSelected: !isPositive,
            ),
            const SizedBox(width: 18),
            InjuryOptionButton.yes(
              isSelected: isPositive,
            ),
          ],
        )
      ],
    );
  }
}
