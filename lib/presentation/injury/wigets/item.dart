// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'option_button.dart';

class InjuryItem extends StatefulWidget {
  //
  final String title;

  final void Function(bool) onChanged;

  const InjuryItem({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  State<InjuryItem> createState() => _InjuryItemState();
}

class _InjuryItemState extends State<InjuryItem> {
  //
  bool isSelected = false;

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            InjuryOptionButton.no(
              isSelected: !isSelected,
              onTap: !isSelected ? () {} : onTap,
            ),
            const SizedBox(width: 18),
            InjuryOptionButton.yes(
              isSelected: isSelected,
              onTap: isSelected ? () {} : onTap,
            ),
          ],
        )
      ],
    );
  }

  void onTap() {
    isSelected = !isSelected;
    widget.onChanged.call(isSelected);
    updateState();
  }
}
