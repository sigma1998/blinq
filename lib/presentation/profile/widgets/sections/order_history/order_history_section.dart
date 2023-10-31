// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'item.dart';

class ProfileOrderHistorySection extends StatelessWidget {
  //
  const ProfileOrderHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'strOrderHistory'.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 20),
        ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ProfileOrderHistoryItem(
              date: '24 Dec 2022, 07:43pm',
              price: '12.12',
            );
          },
        ),
      ],
    );
  }
}
