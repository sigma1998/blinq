// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/bluetooth_item.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/scan_item.dart';

class ConnectToBlinqSelectStateWidget extends StatelessWidget {
  //
  const ConnectToBlinqSelectStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();

    return Center(
      child: Column(
        children: [
          BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
            builder: (context, state) {
              final list = state.scannedBleDevices;

              return Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: List.generate(
                  list.length,
                  (index) {
                    final device = list[index];

                    return ConnectToBlinqBluetoothItem(
                      width: 57,
                      height: 52,
                      fontSize: 14,
                      title: '$index: ${device.name}',
                      onTap: () => cubit.onConnectDevice(device),
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 100),
          ConnectToBlinqScanItem(
            description: 'strChooseBlinq'.tr(),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
