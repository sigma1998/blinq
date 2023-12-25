// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';

class DamagedMediaButton extends StatelessWidget {
  //
  final VoidCallback onTap;

  const DamagedMediaButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyInkWell(
        onTap: onTap,
        padding: const EdgeInsets.all(24),
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset(
          AppDrawables.camera,
        ),
      ),
    );
  }
}
