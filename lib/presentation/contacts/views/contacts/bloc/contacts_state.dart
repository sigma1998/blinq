part of 'contacts_bloc.dart';

@freezed
class ContactsState with _$ContactsState {
  //
  const factory ContactsState({
    @Default(Status.initial) Status status,
    List<ContactResponseModel>? contacts,
    Error? error,
  }) = _ContactsState;
}
