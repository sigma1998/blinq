import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class NameFirstLetter extends StatelessWidget {
  final double size;
  final String? name;

  const NameFirstLetter({
    super.key,
    this.size = 44,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.grey2,
        shape: BoxShape.circle,
      ),
      child: Text(
        name?[0] ?? '',
        style: AppTextStyles.s22W600,
      ),
    );
  }
}
