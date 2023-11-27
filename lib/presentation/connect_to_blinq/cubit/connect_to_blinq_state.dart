part of 'connect_to_blinq_cubit.dart';

@freezed
class ConnectToBlinqState with _$ConnectToBlinqState {
  //
  factory ConnectToBlinqState({
    @Default(DeviceConnectionState.disconnected)
    DeviceConnectionState boardConnectionState,
    @Default(BleConnectionState.disconnected)
    BleConnectionState bleConnectionState,
    @Default([]) List<DiscoveredDevice> scannedBleDevices,
    @Default([]) List<DiscoveredDevice> savedBleDevices,
    @Default(kNa) int pairedState,
    @Default(false) bool scanning,
    @Default('N/A') String stateTexts,
    @Default([]) List<String> receivedData,
    @Default(0) int connectAttempt,
    @Default(null) DiscoveredDevice? recentlyConnected,
  }) = _ConnectToBlinqState;
}

enum BleConnectionState {
  queryState,
  full,
  pairing,
  paired,
  unpaired,
  disconnected,
  error,
}
