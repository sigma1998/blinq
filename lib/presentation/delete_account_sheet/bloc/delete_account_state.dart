part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState({
    @Default(Status.initial) Status status,
    Error? error,
    //
    @Default(false) bool isCodeSent,
  }) = _DeleteAccountState;
}
