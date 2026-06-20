// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/info_container.dart';

class ProfileVehicleCard extends StatelessWidget {
  //
  final String icon;
  final String title;
  final String desc;

  final String value;
  final String unit;

  const ProfileVehicleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
    //
    this.desc = '',
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 48,
            height: 48,
            child: GlassContainer(
              isCircle: true,
              tint: 0.1,
              child: SvgPicture.asset(icon),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.s13W400.copyWith(color: AppColors.lightGreyVariant),
          ),
          // if (desc.isNotEmpty) ...[
          //   const SizedBox(height: 4),
          //   Text(
          //     desc,
          //     style: TextStyle(
          //       fontSize: 11,
          //       fontWeight: FontWeight.w700,
          //       overflow: TextOverflow.ellipsis,
          //       color: Theme.of(context).colorScheme.onSecondary,
          //     ),
          //   ),
          // ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.s20W400.copyWith(color: AppColors.neutralLight),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  unit,
                  style: AppTextStyles.s20W400.copyWith(color: AppColors.neutralGrey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
