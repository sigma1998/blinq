// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
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
    return GestureDetector(
      onTap: onSelect,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 16),
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void onSelect() => NavigationService.back(result: title);
}
