part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  //
  const factory ContactsState({
    @Default(Status.initial) Status status,
    ContactResponseDto? contacts,
    @Default(false) bool isEdit,
    Error? error,
  }) = _ContactsState;
}
