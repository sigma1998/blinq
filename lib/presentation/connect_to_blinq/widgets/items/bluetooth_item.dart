// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class ConnectToBlinqBluetoothItem extends StatelessWidget {
  //
  final String title;
  final double fontSize;
  final Color? color;

  final double? width;
  final double? height;

  final VoidCallback? onTap;

  const ConnectToBlinqBluetoothItem({
    super.key,
    this.title = '',
    this.fontSize = 16,
    this.color,
    //
    this.width,
    this.height,
    //
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            AppDrawables.blinqBloothooth,
            width: width,
            height: height,
            colorFilter: ColorFilter.mode(
              color ?? Theme.of(context).colorScheme.onSecondary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: fontSize,
                  color: color ?? Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
