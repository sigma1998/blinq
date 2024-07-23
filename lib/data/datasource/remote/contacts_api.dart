// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/contact/contact_response_dto.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';

abstract class ContactsApi {
  //
  Future<ContactResponseDto> fetchList([int page]);

  Future<ContactResponseModel> add({
    required ContactRequestModel contact,
    //
    File? file,
  });

  Future<void> addList({required List<ContactRequestModel> contact});

  Future<ContactResponseModel> update({
    required int id,
    required ContactRequestModel contact,
    //
    File? file,
  });

  Future<void> delete(int id);
}

class ContactsApiImpl implements ContactsApi {
  //
  final AppApi api;

  ContactsApiImpl({required this.api});

  @override
  Future<ContactResponseDto> fetchList([int page = 1]) async {
    try {
      final res = await api
          .get(NetworkConstants.contact, queryParameters: {'page': page});
      return ContactResponseDto.fromJson(res);
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
      var image = file == null
          ? null
          : await MultipartFile.fromFile(file.path,
              filename: file.path.split('/').last);
      var formData = FormData.fromMap({
        'name': contact.firstName,
        'last_name': contact.lastName,
        'phone_number': contact.phoneNumber,
        "is_emergency": contact.isEmergency,
        'image': image,
      });
      return api.post(NetworkConstants.contact, data: formData).then((data) {
        return ContactResponseModel.fromJson(data);
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
  }) async {
    try {
      var image = file == null
          ? null
          : await MultipartFile.fromFile(file.path,
              filename: file.path.split('/').last);
      var formData = FormData.fromMap({
        'name': contact.firstName,
        'last_name': contact.lastName,
        'phone_number': contact.phoneNumber,
        "is_emergency": contact.isEmergency,
        'image': image,
      });
      return api
          .put(NetworkConstants.editContact(id), data: formData)
          .then((data) {
        return ContactResponseModel.fromJson(data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      return api.delete(NetworkConstants.editContact(id));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addList({required List<ContactRequestModel> contact}) async {
    try {
      List<Map<String, dynamic>> jsonList = contact.map((e) {
        return e.toJson();
      }).toList();
      await api.post(NetworkConstants.addContactList, data: jsonList);
    } catch (e) {}
  }
}
