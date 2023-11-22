import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/items/bluetooth_item.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/scan_item.dart';

class ConnectToBlinqSelectStateWidget extends StatelessWidget {
  //
  const ConnectToBlinqSelectStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ConnectToBlinqBluetoothItem(
            title: 'strBluetooth',
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 52),
          ConnectToBlinqScanItem(
            description: 'strChoose'.tr(),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 52),
        ],
      ),
    );
  }
}
