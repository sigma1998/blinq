import 'dart:io';

sealed class ContactEditorEvent {}

class OnAddContact extends ContactEditorEvent {
  final File? file;

  OnAddContact({this.file});
}

class OnUpdateContact extends ContactEditorEvent {
  final int id;
  final File? file;

  OnUpdateContact({required this.id, this.file});
}

class OnDeleteContact extends ContactEditorEvent {
  final int id;

  OnDeleteContact({required this.id});
}

class OnUpdateContactImage extends ContactEditorEvent {}
