// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';

class PreviouslyConntectedToBlinqItem extends StatelessWidget {
  //
  final String name;

  final VoidCallback onConnect;
  final VoidCallback onEdit;

  final bool hasDivider;

  const PreviouslyConntectedToBlinqItem({
    super.key,
    required this.name,
    required this.onConnect,
    required this.onEdit,
    //
    this.hasDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyInkWell(
          onTap: onConnect,
          padding: const EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              GestureDetector(
                onTap: onEdit,
                child: const Icon(
                  Icons.edit,
                  size: 24,
                ),
              )
            ],
          ),
        ),
        if (hasDivider)
          const Divider(
            height: 1,
            indent: 16,
            thickness: 1,
            endIndent: 16,
            color: Colors.black,
          ),
      ],
    );
  }
}
