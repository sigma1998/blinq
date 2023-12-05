part of 'second_driver_car_cubit.dart';

@freezed
class SecondDriverCarState with _$SecondDriverCarState {
  const factory SecondDriverCarState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _SecondDriverCarState;
}
