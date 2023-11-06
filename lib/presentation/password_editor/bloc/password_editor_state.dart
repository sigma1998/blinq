part of 'password_editor_bloc.dart';

@freezed
class PasswordEditorState with _$PasswordEditorState {
  const factory PasswordEditorState({
    @Default(Status.initial) Status status,
    Error? error,
    //
    @Default(true) bool isCodeVisible,
    @Default(true) bool isConfirmCodeVisible,
  }) = _PasswordEditorState;
}
