part of 'connect_to_driver_cubit.dart';

@freezed
class ConnectToDriverState with _$ConnectToDriverState {
  const factory ConnectToDriverState({
    @Default(Status.initial) Status status,
    bool? hasBlinq,
    Error? error,
  }) = _ConnectToDriverState;
}
