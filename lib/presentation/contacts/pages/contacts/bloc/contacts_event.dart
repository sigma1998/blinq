import 'package:flutter_contacts/contact.dart';

sealed class ContactsEvent {}

class OnFetchContacts extends ContactsEvent {}

class OnAddContactsList extends ContactsEvent{
  final List<Contact> contacts;

  OnAddContactsList(this.contacts);
}
