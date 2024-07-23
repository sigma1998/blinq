// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';

class DialogItem extends StatelessWidget {
  //
  final String title;
  final VoidCallback onSelect;


  const DialogItem({
    super.key,
    required this.title,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyInkWell(
          onTap: () {
            onSelect.call();
          },
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 14,
          ),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          indent: 14,
          thickness: 1,
          endIndent: 14,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ],
    );
  }

}
