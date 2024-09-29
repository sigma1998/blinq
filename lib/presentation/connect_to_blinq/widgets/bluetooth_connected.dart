import 'package:flutter/cupertino.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../../../utils/components/dialogs/bottom_sheet/edit_name.dart';
import '../../../utils/components/items/connected_device_item.dart';
import '../../../utils/services/dialogs/bottom_sheet.dart';

class BluetoothConnected extends StatelessWidget {
  final VoidCallback onDisconnect;
  final Function onRename;
  final DiscoveredDevice? recentlyConnected;

  const BluetoothConnected({
    super.key,
    required this.onDisconnect,
    required this.recentlyConnected,
    required this.onRename,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ConnectedDeviceItem(
            onEdit: () async {
              final res = await showCustomBottomSheet(
                context: context,
                child: EditName(name: recentlyConnected?.name),
              );
              if (res != null) {
                final newData = recentlyConnected?.copyWith(name: res);
                onRename.call(newData);
              }
            },
            onDisconnect: onDisconnect,
            device: recentlyConnected,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
