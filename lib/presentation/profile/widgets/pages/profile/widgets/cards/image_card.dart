// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileImageCard extends StatelessWidget {
  //
  final String title;
  final String desc;
  final Widget image;

  final VoidCallback onTap;

  const ProfileImageCard({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    //
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 163,
        width: double.infinity,
        child: GlassContainer(
          child: Row(
            children: [
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      desc,
                      style: AppTextStyles.s28W600,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: AppTextStyles.s13W400.copyWith(color: AppColors.lightGreyVariant),
                    ),
                  ],
                ),
              ),
              image,
            ],
          ),
        ),
      ),
    );
  }
}
