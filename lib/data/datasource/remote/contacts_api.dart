// Dart imports:
import 'dart:io';

// Project imports:
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/core/network/api_service.dart';
import 'package:dio/dio.dart';

abstract class ContactsApi {
  //
  Future<List<ContactResponseModel>> fetchList([int count]);

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

class ContactsApiImpl implements ContactsApi {
  //
  final AppApi api;

  ContactsApiImpl({required this.api});

  @override
  Future<List<ContactResponseModel>> fetchList([int count = 0]) async {
    try {
      int page = (count ~/ 10) + 1;

      final res = await api
          .getList(NetworkConstants.contact, queryParameters: {'page': page});
      return res.map((e) => ContactResponseModel.fromJson(e)).toList();
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
}
