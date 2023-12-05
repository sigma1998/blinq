part of 'second_driver_insurance_cubit.dart';

@freezed
class SecondDriverInsuranceState with _$SecondDriverInsuranceState {
  const factory SecondDriverInsuranceState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _SecondDriverInsuranceState;
}
