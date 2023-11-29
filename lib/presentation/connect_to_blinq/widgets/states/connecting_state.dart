// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/items/bluetooth_item.dart';
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/scan_item.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/item.dart';

class ConnectingToBlinqStateWidget extends StatelessWidget {
  //
  const ConnectingToBlinqStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();

    return Column(
      children: [
        BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
          builder: (context, state) {
            return ConnectToBlinqBluetoothItem(
              title: state.recentlyConnected?.name ?? '',
            );
          },
        ),
        const SizedBox(height: 52),
        const ConnectToBlinqItem(),
        const ConnectToBlinqScanItem(),
        const SizedBox(height: 64),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'strConnecting'.tr(),
            ),
          ],
        ),
      ],
    );
  }
}
