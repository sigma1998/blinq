part of 'password_editor_bloc.dart';

@freezed
class PasswordEditorState with _$PasswordEditorState {
  const factory PasswordEditorState({
    @Default(Status.initial) Status status,
    Error? error,
    //
    @Default('') String oldPassword,
    @Default('') String newPassword,
    @Default('') String passwordConfirm,
    //
    @Default(true) bool isCodeVisible,
    @Default(true) bool isConfirmCodeVisible,
  }) = _PasswordEditorState;
}
