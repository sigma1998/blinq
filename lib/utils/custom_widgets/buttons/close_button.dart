// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'default_ink_well.dart';

class MyCloseButton extends StatelessWidget {
  //
  final VoidCallback onTap;

  const MyCloseButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MyInkWell(
      onTap: onTap,
      padding: const EdgeInsets.all(14),
      borderRadius: BorderRadius.circular(100),
      color: Theme.of(context).colorScheme.secondary,
      child: SvgPicture.asset(
        AppDrawables.close,
        width: 16,
        height: 16,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
