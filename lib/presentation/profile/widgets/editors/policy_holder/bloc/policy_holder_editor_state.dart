part of 'policy_holder_editor_bloc.dart';

@freezed
class PolicyHolderEditorState with _$PolicyHolderEditorState {
  const factory PolicyHolderEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _PolicyHolderEditorState;
}
