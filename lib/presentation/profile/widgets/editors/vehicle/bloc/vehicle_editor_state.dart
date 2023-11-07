part of 'vehicle_editor_bloc.dart';

@freezed
class VehicleEditorState with _$VehicleEditorState {
  const factory VehicleEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _VehicleEditorState;
}
