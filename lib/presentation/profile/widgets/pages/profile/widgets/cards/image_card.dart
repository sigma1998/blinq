// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileImageCard extends StatelessWidget {
  //
  final String title;
  final String desc;
  final Widget image;

  final VoidCallback onTap;

  const ProfileImageCard({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    //
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      onTap: onTap,
      height: 163,
      width: double.infinity,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          image,
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      desc,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
