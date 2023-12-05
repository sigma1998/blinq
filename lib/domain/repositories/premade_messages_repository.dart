// Project imports:
import 'package:blinq/data/datasource/remote/premade_messages_api.dart';
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

abstract class PremadeMessagesRepository {
  ///
  /// Remote API
  ///
  Future<PreMadeMessageResponseDto> fetchList();

  Future<PreMadeMessageResponseModel> add(
    PreMadeMessageRequestModel premadeMessage,
  );

  Future<PreMadeMessageResponseModel> update({
    required int id,
    required PreMadeMessageRequestModel premadeMessage,
  });

  Future<void> delete(int id);
}

class PremadeMessagesRepositoryImpl implements PremadeMessagesRepository {
  //
  final PremadeMessagesApi api;

  PremadeMessagesRepositoryImpl({required this.api});

  ///
  /// Premade Message
  ///

  @override
  Future<PreMadeMessageResponseDto> fetchList() async {
    try {
      return await api.fetchList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PreMadeMessageResponseModel> add(
      PreMadeMessageRequestModel contact) async {
    try {
      return await api.add(contact);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PreMadeMessageResponseModel> update({
    required int id,
    required PreMadeMessageRequestModel premadeMessage,
  }) async {
    try {
      return await api.update(id: id, premadeMessage: premadeMessage);
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
