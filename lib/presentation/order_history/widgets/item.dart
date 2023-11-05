// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class ProfileOrderHistoryItem extends StatelessWidget {
  //
  final String date;
  final String price;

  const ProfileOrderHistoryItem({
    super.key,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SvgPicture.asset(AppDrawables.cart),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              date,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            '\$$price',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
