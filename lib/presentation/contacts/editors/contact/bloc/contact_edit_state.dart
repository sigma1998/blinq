part of 'contact_edit_bloc.dart';

@freezed
class ContactEditState with _$ContactEditState {
  const factory ContactEditState({
    @Default(Status.initial) Status status,
    File? image,
    Error? error,
  }) = _ContactEditState;
}
