// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';

class ConnectToBlinqScanItem extends StatelessWidget {
  //
  final String description;

  final bool animate;

  final Color? color;

  const ConnectToBlinqScanItem({
    super.key,
    this.description = '',
    this.animate = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (animate)
          Lottie.asset(
            AppDrawables.scanAnim,
            repeat: true,
            animate: animate,
          ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (description.isNotEmpty) ...[
              const Text(
                '',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20)
            ],
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: SvgPicture.asset(
                AppDrawables.mobilePhone,
                colorFilter: ColorFilter.mode(
                  color ?? Theme.of(context).colorScheme.onSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            if (description.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ],
    );
  }
}
