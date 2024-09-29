// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

class DamagedMediaEmptyStateWidget extends StatelessWidget {
  //
  const DamagedMediaEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '11. ${'strTakePicture'.tr()}',
          style: AppTextStyles.s22W600,
        ),
      ],
    );
  }
}
