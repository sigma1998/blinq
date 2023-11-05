// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/reports/widgets/items/report_item.dart';

class ReportsAccident extends StatelessWidget {
  //
  const ReportsAccident({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'strAccidentalReports'.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 20),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ProfileReportItem(
              date: '24 Dec 2022, 07:43pm',
            );
          },
        ),
      ],
    );
  }
}
