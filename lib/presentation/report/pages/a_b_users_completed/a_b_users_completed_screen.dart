// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/glass_button.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:blinq/utils/components/wrappers/screen_background.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/circumstances/circumstances_screen.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/components/app_bar/progress_app_bar.dart';

class ABUsersCompletedScreen extends StatelessWidget {
  static const String route = '/a_b_users_completed';

  const ABUsersCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      appBar: const ProgressAppBar(
        step: 10,
        title: 'Accident',
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 96,
                    height: 96,
                    child: GlassContainer(
                      padding: const EdgeInsets.all(12),
                      isCircle: true,
                      tint: 0.1,
                      child: SvgPicture.asset(
                        AppDrawables.twoPeople,
                        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'strABCompleted'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s28W600,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'strPartsCommon'.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.s17W400,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GlassButton(
              backgroundColor: AppColors.primaryColor,
              tint: 0.4,
              title: 'Continue',
              onTap: () {
                NavigationService.pushNamed(
                  routeName: CircumstancesScreen.route,
                  nestedKey: NavigationService.homeNavigatorKey,
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GlassButton(
              title: 'Go Back',
              tint: 0.08,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
