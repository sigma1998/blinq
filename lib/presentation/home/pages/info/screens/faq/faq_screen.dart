// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/home/pages/info/widgets/card.dart';
import 'widgets/item.dart';

class HomeInfoFaqScreen extends StatelessWidget {
  //
  static const String route = '/home_info_faq_screen';

  const HomeInfoFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeInfoCard(
      title: 'strFrequentlyAskedQuestions'.tr(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.48,
          child: ListView.builder(
            itemCount: faqItems.length,
            itemBuilder: (context, index) {
              final title = faqItems.keys.toList()[index];
              final description = faqItems.values.toList()[index];

              return HomeInfoFaqItem(
                title: title,
                description: description,
              );
            },
          ),
        ),
      ],
    );
  }

  Map<String, String> get faqItems => {
        'strQuession1'.tr(): 'strAnswear1'.tr(),
        'strQuession2'.tr(): 'strAnswear2'.tr(),
        'strQuession3'.tr(): 'strAnswear3'.tr(),
        'strQuession4'.tr(): 'strAnswear4'.tr(),
      };
}
