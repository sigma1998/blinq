part of 'second_driver_cubit.dart';

@freezed
class SecondDriverState with _$SecondDriverState {
  const factory SecondDriverState({
    @Default(Status.initial) Status status,
    bool? isSecondDriverBlinq,
    ProfileResponseModel? secondDriver,
    Error? error,
  }) = _SecondDriverState;
}
