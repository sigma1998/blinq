part of 'second_driver_cubit.dart';

@freezed
class SecondDriverState with _$SecondDriverState {
  const factory SecondDriverState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _SecondDriverState;
}
