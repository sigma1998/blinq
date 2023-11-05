part of 'email_editor_bloc.dart';

@freezed
class EmailEditorState with _$EmailEditorState {
  const factory EmailEditorState({
    @Default(Status.initial) Status status,
    Error? error,
    //
    @Default('') String oldEmail,
    @Default('') String newEmail,
    @Default('') String verificationCode,
    //
    @Default(false) bool isCodeSent,
  }) = _EmailEditorState;
}
