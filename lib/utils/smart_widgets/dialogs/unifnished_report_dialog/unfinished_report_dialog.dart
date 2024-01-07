// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class UnfinishedReportDialog extends StatelessWidget {
  //
  final String dateTime;

  const UnfinishedReportDialog({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyInfoContainer(
        padding: const EdgeInsets.all(36),
        margin: const EdgeInsets.symmetric(horizontal: 51),
        child: Column(
          children: [
            Text(
              'strYouHaveUnfinishedReport'.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'strReportCreatedAt'.tr() + dateTime.substring(0, 10),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            ),
            const SizedBox(height: 16),
            MyButton.secondary(
              label: 'strContinue'.tr(),
              onTap: () {
                Navigator.of(context).pop(true);
              },
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MyButton.tertiary(
              label: 'strCreateNew'.tr(),
              onTap: () {
                Navigator.of(context).pop(false);
              },
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
