// Flutter imports:
import 'package:blinq/presentation/connect_to_blinq/bloc/connect_to_blinq_bloc.dart';
import 'package:blinq/presentation/connect_to_blinq/bloc/connect_to_blinq_event.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/items/bluetooth_item.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/item.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/items/scan_item.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectToBlinqInitialStateWidget extends StatelessWidget {
  //
  const ConnectToBlinqInitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConnectToBlinqBloc>();

    return Column(
      children: [
        const SizedBox(height: 16),
        const ConnectToBlinqBluetoothItem(),
        const SizedBox(height: 52),
        const ConnectToBlinqItem(),
        const ConnectToBlinqScanItem(),
        const SizedBox(height: 52),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton.tertiary(
              label: 'strScan'.tr(),
              onTap: () => bloc.add(OnStartScanningBlinq()),
            ),
          ],
        ),
      ],
    );
  }
}
