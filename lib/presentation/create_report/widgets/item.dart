// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class CreateReportItem extends StatelessWidget {
  //
  final String title;
  final String icon;

  final Color color;

  final void Function() onTap;

  const CreateReportItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color = const Color(0xFF1B1B1B),
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      onTap: onTap,
      color: color,
      padding: const EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 20,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SvgPicture.asset(
            AppDrawables.arrowRight,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
