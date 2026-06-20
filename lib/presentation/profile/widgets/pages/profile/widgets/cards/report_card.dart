// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';

class ProfileReportCard extends StatelessWidget {
  //
  const ProfileReportCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfileBloc>();

    return GestureDetector(
      onTap: bloc.onReportsPressed,
      child: GlassContainer(
        radius: 16,
        padding: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: GlassContainer(
                  isCircle: true,
                  tint: 0.08,
                  child: SvgPicture.asset(Assets.iconsFileFilled),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'strReports'.tr(),
                style: AppTextStyles.s17W600.copyWith(color: AppColors.white),
              ),
              const Expanded(child: SizedBox(width: 16)),
              SvgPicture.asset(AppDrawables.arrowRight),
            ],
          ),
        ),
      ),
    );
  }
}
