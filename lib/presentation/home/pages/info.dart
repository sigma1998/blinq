// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/home/widgets/info_item.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class HomeInfo extends StatelessWidget {
  //
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                HomeInfoItem(
                  onTap: () {},
                  title: 'strTechnicalData'.tr(),
                  backgroundImage: AppDrawables.technicalData,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: HomeInfoItem(
                        onTap: () {},
                        title: 'strRegistration'.tr(),
                        backgroundImage: AppDrawables.registration,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: HomeInfoItem(
                        onTap: () {},
                        title: 'strMastHead'.tr(),
                        backgroundImage: AppDrawables.masthead,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                HomeInfoItem(
                  onTap: () {},
                  backgroundImage: AppDrawables.faq,
                  title: 'strFrequentlyAskedQuestions'.tr(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
