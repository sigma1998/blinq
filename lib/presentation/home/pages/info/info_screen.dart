// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/home/pages/info/info_bloc.dart';
import 'package:blinq/presentation/home/widgets/info_item.dart';

class HomeInfoScreen extends StatelessWidget {
  //
  static const String route = '/home_info_screen';

  const HomeInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = HomeInfoBloc();

    return SafeArea(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                HomeInfoItem(
                  title: 'strTechnicalData'.tr(),
                  onTap: bloc.onTechnicalDataPressed,
                  backgroundImage: AppDrawables.technicalData,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: HomeInfoItem(
                        title: 'strRegistration'.tr(),
                        onTap: bloc.onRegistrationPressed,
                        backgroundImage: AppDrawables.registration,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: HomeInfoItem(
                        title: 'strMastHead'.tr(),
                        onTap: bloc.onMastHeadPressed,
                        backgroundImage: AppDrawables.masthead,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                HomeInfoItem(
                  onTap: bloc.onFaqPressed,
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
