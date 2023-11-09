// Dart imports:
import 'dart:io';

// Project imports:
import 'package:blinq/data/datasource/local/contacts_local_db.dart';
import 'package:blinq/data/datasource/remote/contacts_api.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';

abstract class ContactsRepository {
  ///
  /// Remote API
  ///
  Future<List<ContactResponseModel>> fetchList();

  Future<ContactResponseModel> add({
    required ContactRequestModel contact,
    //
    File? file,
  });

  Future<ContactResponseModel> update({
    required int id,
    required ContactRequestModel contact,
    //
    File? file,
  });

  Future<void> delete(int id);

  ///
  /// Local storage
  ///

  List<ContactResponseModel> getContacts();

  void setContacts(List<ContactResponseModel> contact);
}

class ContactsRepositoryImpl implements ContactsRepository {
  //
  final ContactsApi api;
  final ContactsLocalStorage localStorage;

  ContactsRepositoryImpl({required this.api, required this.localStorage});

  ///
  /// Contact
  ///

  @override
  Future<List<ContactResponseModel>> fetchList() async {
    try {
      return await api.fetchList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ContactResponseModel> add({
    required ContactRequestModel contact,
    //
    File? file,
  }) {
    try {
      return api.add(contact: contact, file: file).then((data) {
        localStorage.setContacts([data]);
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ContactResponseModel> update({
    required int id,
    required ContactRequestModel contact,
    //
    File? file,
  }) {
    try {
      return api.update(id: id, contact: contact, file: file).then((data) {
        localStorage.setContacts([data]);
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) {
    try {
      return api.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  ///
  /// Local storage
  ///

  @override
  List<ContactResponseModel> getContacts() => localStorage.getContacts();

  @override
  void setContacts(List<ContactResponseModel> contact) =>
      localStorage.setContacts(contact);
}
