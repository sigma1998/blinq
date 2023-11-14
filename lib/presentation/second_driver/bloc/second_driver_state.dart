part of 'second_driver_bloc.dart';

@freezed
class SecondDriverState with _$SecondDriverState {
  const factory SecondDriverState({
    @Default(Status.initial) Status status,
    ProfileResponseModel? secondDriver,
    Error? error,
  }) = _SecondDriverState;
}
