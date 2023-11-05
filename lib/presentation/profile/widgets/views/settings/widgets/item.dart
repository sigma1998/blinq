// Flutter imports:
import 'package:flutter/material.dart';

// Flutter imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class SettingsItem extends StatelessWidget {
  //
  final String title;

  final VoidCallback? onTap;
  final Widget? trailing;

  const SettingsItem({
    super.key,
    required this.title,
    //
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 32,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            trailing ??
                SvgPicture.asset(
                  AppDrawables.arrowRight,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
