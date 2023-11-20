import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Arrow extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const Arrow({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 160),
        child: IconButton(
          icon: SvgPicture.asset(
            icon,
            colorFilter:
            ColorFilter.mode(Theme
                .of(context)
                .colorScheme
                .primary, BlendMode.srcIn),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
