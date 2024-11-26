// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
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
    return MyInfoContainer(
      borderRadius: BorderRadius.circular(26),
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 88,
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
            style: AppTextStyles.s13W400.copyWith(color: AppColors.grey1),
          ),
        ],
      ),
    );
  }
}
