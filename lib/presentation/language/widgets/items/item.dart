// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class LanguageItem extends StatelessWidget {
  //
  final String title;
  final VoidCallback onSelect;

  const LanguageItem({
    super.key,
    required this.title,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SvgPicture.asset(AppDrawables.tick),
        ],
      ),
    );
  }
}
