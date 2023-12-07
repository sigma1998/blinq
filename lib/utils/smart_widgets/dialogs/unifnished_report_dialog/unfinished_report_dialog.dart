// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';

class UnfinishedReportDialog extends StatelessWidget {
  //
  final VoidCallback onContinue;

  const UnfinishedReportDialog({
    super.key,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return MyInfoContainer(
      padding: const EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height * 0.25,
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
          MyButton.secondary(
            label: 'strContinue'.tr(),
            onTap: onContinue,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
