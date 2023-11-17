part of 'premade_message_editor_bloc.dart';

@freezed
class PremadeMessageEditorState with _$PremadeMessageEditorState {
  const factory PremadeMessageEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _PremadeMessageEditorState;
}
