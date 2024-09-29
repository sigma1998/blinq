// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/yes_no_button.dart';

class InjuryItem extends StatelessWidget {
  //
  final String title;

  final void Function(bool?) onChanged;

  const InjuryItem({
    super.key,
    required this.title,
    required this.onChanged,
  });

  //
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.s20W400,
        ),
        const SizedBox(height: 16),
        YesNoButton(
          onChanged: onChanged,
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkGrey,
        )
      ],
    );
  }
}
