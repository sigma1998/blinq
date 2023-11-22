part of 'connect_to_blinq_bloc.dart';

@freezed
class ConnectToBlinqState with _$ConnectToBlinqState {
  const factory ConnectToBlinqState({
    @Default(Status.initial) Status status,
    @Default(false) bool isScanning,
    Error? error,
  }) = _ConnectToBlinqState;
}
