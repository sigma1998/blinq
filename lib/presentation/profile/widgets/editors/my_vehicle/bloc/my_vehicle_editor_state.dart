part of 'my_vehicle_editor_bloc.dart';

@freezed
class MyVehicleEditorState with _$MyVehicleEditorState {
  const factory MyVehicleEditorState({
    @Default(Status.initial) Status status,
    Error? error,
  }) = _MyVehicleEditorState;
}
