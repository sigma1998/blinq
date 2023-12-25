// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileVehicleCard extends StatelessWidget {
  //
  final String icon;
  final String title;
  final String desc;

  final String value;
  final String unit;

  const ProfileVehicleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    //
    this.desc = '',
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(height: 24),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (desc.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              desc,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 26,
                  height: 16 / 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  unit,
                  style: const TextStyle(
                    height: 16 / 20,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
