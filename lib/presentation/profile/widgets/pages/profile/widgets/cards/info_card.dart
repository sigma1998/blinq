// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileInfoCard extends StatelessWidget {
  //
  final String image;
  final String title;
  final String desc;

  final VoidCallback? onTap;

  const ProfileInfoCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    //
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 54,
          ),
          const SizedBox(height: 24),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
