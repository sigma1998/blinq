// Dart imports:
import 'dart:io';

// Project imports:
import 'package:blinq/data/datasource/remote/contacts_api.dart';
import 'package:blinq/data/model/contact/contact_response_dto.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';

abstract class ContactsRepository {
  ///
  /// Remote API
  ///
  Future<ContactResponseDto> fetchList([int page]);

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
}

class ContactsRepositoryImpl implements ContactsRepository {
  //
  final ContactsApi api;

  ContactsRepositoryImpl({required this.api});

  ///
  /// Contact
  ///

  @override
  Future<ContactResponseDto> fetchList([int page = 1]) async {
    try {
      return await api.fetchList(page);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ContactResponseModel> add({
    required ContactRequestModel contact,
    //
    File? file,
  }) async {
    try {
      return await api.add(contact: contact, file: file);
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
  }) async {
    try {
      return await api.update(id: id, contact: contact, file: file);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      return await api.delete(id);
    } catch (e) {
      rethrow;
    }
  }
}
