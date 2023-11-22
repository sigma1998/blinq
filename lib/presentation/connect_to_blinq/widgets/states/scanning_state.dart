// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/items/scan_item.dart';

class ConnectToBlinqScanningStateWidget extends StatelessWidget {
  //
  const ConnectToBlinqScanningStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectToBlinqScanItem(
      animate: true,
      description: 'strSearching'.tr(),
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
