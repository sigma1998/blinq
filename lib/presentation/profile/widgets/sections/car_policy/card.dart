// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileCarPolicyCard extends StatelessWidget {
  //
  final String image;
  final String title;
  final String desc;

  const ProfileCarPolicyCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      child: Column(
        children: [
          Image.asset(
            image,
            height: 54,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
