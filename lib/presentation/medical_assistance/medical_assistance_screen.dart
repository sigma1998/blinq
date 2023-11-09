// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'widgets/item.dart';

class MedicalAssistanceScreen extends StatelessWidget {
  //
  static const route = '/medical_assistance';

  const MedicalAssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'strMedicalAssistance'.tr()),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 48,
          horizontal: 28,
        ).copyWith(bottom: 0),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'strMedicalAssistance'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          Text(
            'strProvidePeopleFirstKit'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          const SizedBox(height: 50),
          ListView.builder(
            shrinkWrap: true,
            itemCount: titles.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final title = titles[index];
              final subtitle = subtitles[index];

              return MedicalAssistanceItem(
                title: title,
                subtitle: subtitle,
              );
            },
          ),
        ],
      ),
    );
  }

  List<String> get titles => [
        'strTitle1'.tr(),
        'strTitle2'.tr(),
        'strTitle3'.tr(),
        'strTitle4'.tr(),
        'strTitle5'.tr(),
        'strTitle6'.tr(),
        'strTitle7'.tr(),
        'strTitle8'.tr()
      ];

  List<String> get subtitles => [
        'strSubTitle1'.tr(),
        'strSubTitle2'.tr(),
        'strSubTitle3'.tr(),
        'strSubTitle4'.tr(),
        'strSubTitle5'.tr(),
        'strSubTitle6'.tr(),
        'strSubTitle7'.tr(),
        'strSubTitle8'.tr()
      ];
}
