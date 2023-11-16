sealed class ContactsEvent {}

class OnFetchContacts extends ContactsEvent {}

class OnSelectContact extends ContactsEvent {
  final String contactId;

  OnSelectContact({required this.contactId});
}
