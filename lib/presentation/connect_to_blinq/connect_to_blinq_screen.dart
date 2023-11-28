// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/states/initial_state.dart';
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/utils/custom_widgets/buttons/close_button.dart';
import 'widgets/states/connected_state.dart';
import 'widgets/states/connecting_state.dart';
import 'widgets/states/scanning_state.dart';
import 'widgets/states/select_state.dart';
import 'widgets/card/card.dart';

class ConnectToBlinqScreen extends StatelessWidget {
  //
  static const route = '/connect_to_blinq';

  const ConnectToBlinqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();

    return SafeArea(
      child: BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 30,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildStateWidget(state),
                      const SizedBox(height: 50),
                      if (!state.scanning &&
                          state.boardConnectionState !=
                              DeviceConnectionState.connected &&
                          state.savedBleDevices.isNotEmpty) ...[
                        const PreviouslyConnectedToBlinqCard(),
                      ],
                    ],
                  ),
                ),
                MyCloseButton(
                  onTap: cubit.onNavigateBack,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStateWidget(ConnectToBlinqState state) {
    switch (state.boardConnectionState) {
      case DeviceConnectionState.connecting:
        return const ConnectingToBlinqStateWidget();
      case DeviceConnectionState.connected:
        if (state.bleConnectionState == BleConnectionState.paired) {
          return const ConnectedToBlinqStateWidget();
        } else {
          return const ConnectingToBlinqStateWidget();
        }
      case DeviceConnectionState.disconnected:
        if (state.scanning) {
          return const ConnectToBlinqScanningStateWidget();
        } else if (state.scannedBleDevices.isNotEmpty &&
            !state.scanning &&
            state.savedBleDevices.isEmpty) {
          return const ConnectToBlinqSelectStateWidget();
        } else {
          return const ConnectToBlinqInitialStateWidget();
        }

      default:
        return const ConnectToBlinqInitialStateWidget();
    }
  }
}
