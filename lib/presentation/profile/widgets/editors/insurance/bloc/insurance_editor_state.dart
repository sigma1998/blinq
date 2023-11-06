part of 'insurance_editor_bloc.dart';

@freezed
class InsuranceEditorState with _$InsuranceEditorState {
  const factory InsuranceEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _InsuranceEditorState;
}
