// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class BlinqActivatedButton extends StatelessWidget {
  //
  final String title;
  final String icon;

  final VoidCallback onTap;

  const BlinqActivatedButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      width: 295,
      height: 114,
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SvgPicture.asset(
                icon,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
