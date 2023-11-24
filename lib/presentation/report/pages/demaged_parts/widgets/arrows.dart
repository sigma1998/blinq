import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Arrow extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final Alignment alignment;

  const Arrow(
      {Key? key,
      required this.icon,
      required this.onTap,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(top: 160),
        child: IconButton(
          icon: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}
