part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(Status.initial) Status status,
    ProfileResponseModel? profile,
    Error? error,
  }) = _ProfileState;
}
