// Flutter imports:
import 'package:flutter/material.dart';

class ProfileUserDetailsItem extends StatelessWidget {
  //
  final String title;
  final String detail;

  final bool hasDivider;

  const ProfileUserDetailsItem({
    super.key,
    required this.title,
    required this.detail,
    //
    this.hasDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                detail,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (hasDivider) ...[
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }
}
