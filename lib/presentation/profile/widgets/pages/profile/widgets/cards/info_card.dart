// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileInfoCard extends StatelessWidget {
  //
  final String image;
  final String title;
  final String desc;

  final VoidCallback? onTap;

  const ProfileInfoCard({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    //
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        radius: 16,
        blur: 6,
        child: Column(
          children: [
            const SizedBox(height: 16),
            Image.asset(
              image,
              height: 104,
              width: 88,
            ),
            const SizedBox(height: 24),
            Text(
              desc,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s16W600,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s15W400.copyWith(color: AppColors.lightGreyVariant),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
