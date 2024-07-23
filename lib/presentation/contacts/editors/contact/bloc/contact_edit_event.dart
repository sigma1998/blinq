// Dart imports:
import 'dart:io';

import 'package:flutter_contacts/contact.dart';

sealed class ContactEditEvent {}

class OnAddContact extends ContactEditEvent {
  final File? file;

  OnAddContact({this.file});
}

class OnUpdateContact extends ContactEditEvent {
  final int id;
  final File? file;

  OnUpdateContact({required this.id, this.file});
}

class OnDeleteContact extends ContactEditEvent {
  final int id;

  OnDeleteContact({required this.id});
}

class OnUpdateContactImage extends ContactEditEvent {}
