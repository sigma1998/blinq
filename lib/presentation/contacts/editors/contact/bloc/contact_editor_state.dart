part of 'contact_editor_bloc.dart';

@freezed
class ContactEditorState with _$ContactEditorState {
  const factory ContactEditorState({
    @Default(Status.initial) Status status,
    File? image,
    Error? error,
  }) = _ContactEditorState;
}
