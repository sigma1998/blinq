import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/bluetooth_connected.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/device_connecting_widget.dart';
import 'package:blinq/presentation/connect_to_blinq/widgets/disconnected_state.dart';
import 'package:blinq/utils/components/animations/circular_bluetooth_searching_animation.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/components/items/cicular_bluetooth_connecting_item.dart';
import 'package:blinq/utils/components/items/cicular_bluetooth_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/components/animations/bluetooth_searching_animation.dart';
import '../cubit/connect_to_blinq_cubit.dart';
import '../widgets/discovered_ble_devices.dart';

class BluetoothScanPage extends StatelessWidget {
  const BluetoothScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();
    return BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
      builder: (context, state) {
        print('STATE_______${state.bleConnectionState}');
        print('STATE_______${state.boardConnectionState}');
        return state.recentlyConnected != null &&
                state.bleConnectionState == BleConnectionState.paired
            ? BluetoothConnected(
                recentlyConnected: state.recentlyConnected,
                onRename: (DiscoveredDevice? newData) {
                  cubit.renameCurrentDevice(newData!);
                },
                onDisconnect: () {
                  cubit.disconnect(true);
                },
              )
            : Scaffold(
                body: state.boardConnectionState ==
                        DeviceConnectionState.connecting
                    ? CircularBluetoothConnectingItem(
                        device: state.recentlyConnected,
                      )
                    : Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(width: double.infinity),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularBluetoothSearchingAnimation(
                                      scanning: state.scanning,
                                    ),
                                  ],
                                ),
                              ),

                              // Expanded(
                              //   child: ListView(
                              //     children: [
                              //       ///connecting
                              //       if (state.boardConnectionState ==
                              //           DeviceConnectionState.connecting)
                              //         DeviceConnectingWidget(
                              //           device: state.recentlyConnected,
                              //         ),
                              //
                              //       AnimatedContainer(
                              //         height: (state.scannedBleDevices.isNotEmpty &&
                              //                 state.boardConnectionState !=
                              //                     DeviceConnectionState.connecting)
                              //             ? 20.h
                              //             : 150.h,
                              //         duration: const Duration(milliseconds: 200),
                              //       ),
                              //
                              //       ///discovered ble devices
                              //       if (state.scannedBleDevices.isNotEmpty &&
                              //           state.boardConnectionState !=
                              //               DeviceConnectionState.connecting)
                              //         DiscoveredBleDevices(
                              //           scannedBleDevices: state.scannedBleDevices,
                              //           onTap: (DiscoveredDevice device) {
                              //             cubit.onConnectDevice(device);
                              //           },
                              //         ),
                              //       SizedBox(height: 40.h),
                              //
                              //       ///loading animation
                              //       if (state.boardConnectionState !=
                              //           DeviceConnectionState.connecting)
                              //         BluetoothSearchingAnimation(
                              //           searching: state.scanning,
                              //         ),
                              //     ],
                              //   ),
                              // ),

                              ///button
                              Container(
                                padding: EdgeInsets.only(bottom: 110.h),
                                child: state.scanning == false &&
                                        state.boardConnectionState !=
                                            DeviceConnectionState.connected &&
                                        state.scannedBleDevices.length == 1
                                    ? RegularButton(
                                        title: 'Connect',
                                        onTap: () {
                                          cubit.onConnectDevice(
                                              state.scannedBleDevices.first);
                                        },
                                      )
                                    : state.scanning == false &&
                                            state.boardConnectionState !=
                                                DeviceConnectionState.connected
                                        ? RegularButton(
                                            title: 'Scan',
                                            onTap: () {
                                              cubit.restartScanning();
                                            },
                                          )
                                        : state.scanning &&
                                                state.boardConnectionState !=
                                                    DeviceConnectionState
                                                        .connected
                                            ? RegularButton(
                                                title: 'Stop',
                                                background: AppColors.darkGrey,
                                                onTap: () {
                                                  cubit.stopScanning();
                                                },
                                              )
                                            : RegularButton(
                                                title: 'Disconnect',
                                                onTap: () {
                                                  cubit.disconnect(true);
                                                },
                                              ),
                              ),
                            ],
                          ),
                          if (state.scannedBleDevices.isNotEmpty)
                            CircularBluetoothItem(
                              type: 0,
                              device: state.scannedBleDevices[0],
                              onTap: () {
                                cubit.onConnectDevice(
                                    state.scannedBleDevices[0]);
                              },
                            ),
                          if (state.scannedBleDevices.length > 1)
                            CircularBluetoothItem(
                              type: 1,
                              device: state.scannedBleDevices[1],
                              onTap: () {
                                cubit.onConnectDevice(
                                    state.scannedBleDevices[1]);
                              },
                            ),
                          if (state.scannedBleDevices.length > 2)
                            CircularBluetoothItem(
                              type: 2,
                              device: state.scannedBleDevices[2],
                              onTap: () {
                                cubit.onConnectDevice(
                                    state.scannedBleDevices[2]);
                              },
                            )
                        ],
                      ),
              );
      },
    );
  }

  getWidgetState(ConnectToBlinqState state) {
    switch (state.boardConnectionState) {
      case DeviceConnectionState.connecting:
        return DeviceConnectingWidget(device: state.recentlyConnected);
      case DeviceConnectionState.connected:
        return const SizedBox();
      case DeviceConnectionState.disconnected:
        return const DisconnectedState();
      default:
        return const SizedBox();
    }
  }
}
