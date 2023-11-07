part of 'driver_editor_bloc.dart';

@freezed
class DriverEditorState with _$DriverEditorState {
  const factory DriverEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _DriverEditorState;
}
