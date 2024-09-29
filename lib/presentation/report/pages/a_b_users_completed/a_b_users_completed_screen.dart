// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
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
    return SafeArea(
      child: Scaffold(
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
                    Container(
                      width: 96,
                      height: 96,
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.darkGrey,
                      ),
                      child: SvgPicture.asset(
                        AppDrawables.twoPeople,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'strABCompleted'.tr(),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s34W600,
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
            RegularButton(
              title: 'Next',
              onTap: () {
                NavigationService.pushNamed(
                    routeName: CircumstancesScreen.route,
                    nestedKey: NavigationService.homeNavigatorKey);
              },
            ),
            const SizedBox(height: 12),
            RegularButton(
              title: 'Back',
              background: AppColors.darkGrey,
              onTap: () {},
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
