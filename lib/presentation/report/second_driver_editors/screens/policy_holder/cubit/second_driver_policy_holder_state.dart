part of 'second_driver_policy_holder_cubit.dart';

@freezed
class SecondDriverPolicyHolderState with _$SecondDriverPolicyHolderState {
  const factory SecondDriverPolicyHolderState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _SecondDriverPolicyHolderState;
}
