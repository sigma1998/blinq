// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';
import 'package:blinq/utils/navigation_service.dart';

class DialogItem extends StatelessWidget {
  //
  final String title;

  const DialogItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyInkWell(
          onTap: onSelect,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 14,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  title,
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

  void onSelect() => NavigationService.back(result: title);
}
