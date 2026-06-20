import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/generated/assets.dart';
import 'package:blinq/utils/components/dialogs/bottom_sheet/edit_name.dart';
import 'package:blinq/utils/components/items/history_devices_item.dart';
import 'package:blinq/utils/services/dialogs/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cubit/connect_to_blinq_cubit.dart';

class BluetoothHistoryPage extends StatelessWidget {
  final VoidCallback onConnectToSavedItem;

  const BluetoothHistoryPage({
    super.key,
    required this.onConnectToSavedItem,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();
    return BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
      builder: (context, state) {
        return state.savedBleDevices.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Assets.imagesEmptyList),
                  const SizedBox(height: 16),
                  const Text('Your history list is empty', style: AppTextStyles.s17W600)
                ],
              )
            : ListView.builder(
                itemCount: state.savedBleDevices.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (BuildContext context, int index) {
                  final device = state.savedBleDevices[index];
                  return HistoryDevicesItem(
                    isConnected: (device.id == state.recentlyConnected?.id && state.bleConnectionState == BleConnectionState.paired),
                    onEdit: () async {
                      final res = await showCustomBottomSheet(
                        context: context,
                        child: EditName(name: device.name),
                      );
                      if (res != null) {
                        final newData = device.copyWith(name: res);
                        cubit.renameDevice(newData);
                      }
                    },
                    onLink: () async {
                      await cubit.disconnect(true);
                      cubit.connectToDetectedDevice(device);
                      onConnectToSavedItem.call();
                    },
                    device: device,
                  );
                },
              );
      },
    );
  }
}
