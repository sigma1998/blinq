// Flutter imports:
import 'package:blinq/presentation/connect_to_blinq/pages/bluetooth_history_page.dart';
import 'package:blinq/presentation/connect_to_blinq/pages/bluetooth_scan_page.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/bluetooth_page_indicator.dart';
import 'package:blinq/utils/components/app_bar/back_app_bar.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/states/initial_state.dart';
import 'package:blinq/utils/custom_widgets/buttons/close_button.dart';
import 'widgets/card/card.dart';
import 'widgets/states/connected_state.dart';
import 'widgets/states/connecting_state.dart';
import 'widgets/states/scanning_state.dart';
import 'widgets/states/select_state.dart';

class ConnectToBlinqScreen extends StatefulWidget {
  //
  static const route = '/connect_to_blinq';

  const ConnectToBlinqScreen({super.key});

  @override
  State<ConnectToBlinqScreen> createState() => _ConnectToBlinqScreenState();
}

class _ConnectToBlinqScreenState extends State<ConnectToBlinqScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();
    return Scaffold(
      appBar: BackAppBar(
        title: 'Connection to BLINQ',
        onTap: () {
          cubit.onNavigateBack();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          BluetoothPageIndicator(
            currentIndex: currentIndex,
            onTap: (int index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                const BluetoothScanPage(),
                BluetoothHistoryPage(
                  onConnectToSavedItem: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 60,
        backgroundColor: Colors.transparent,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            MyCloseButton(
              onTap: cubit.onNavigateBack,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Align(
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
            );
          },
        ),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
