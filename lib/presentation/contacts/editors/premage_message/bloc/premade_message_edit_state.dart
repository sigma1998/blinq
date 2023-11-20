part of 'premade_message_edit_bloc.dart';

@freezed
class PreMadeMessageEditorState with _$PreMadeMessageEditorState {
  const factory PreMadeMessageEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _PreMadeMessageEditorState;
}
