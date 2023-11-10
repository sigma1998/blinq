// Project imports:
import 'package:blinq/data/datasource/local/premade_messages_local_db.dart';
import 'package:blinq/data/datasource/remote/premade_messages_api.dart';
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

abstract class PremadeMessagesRepository {
  ///
  /// Remote API
  ///
  Future<PremadeMessageResponseDto> fetchList();

  Future<PremadeMessageResponseModel> add(
    PremadeMessageRequestModel premadeMessage,
  );

  Future<PremadeMessageResponseModel> update({
    required int id,
    required PremadeMessageRequestModel premadeMessage,
  });

  Future<void> delete(int id);

  ///
  /// Local storage
  ///

  PremadeMessageResponseDto getPremadeMessages();

  void setPremadeMessages(PremadeMessageResponseDto premadeMessage);
}

class PremadeMessagesRepositoryImpl implements PremadeMessagesRepository {
  //
  final PremadeMessagesApi api;
  final PremadeMessagesLocalStorage localStorage;

  PremadeMessagesRepositoryImpl(
      {required this.api, required this.localStorage});

  ///
  /// Premade Message
  ///

  @override
  Future<PremadeMessageResponseDto> fetchList() async {
    try {
      return await api.fetchList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PremadeMessageResponseModel> add(PremadeMessageRequestModel contact) {
    try {
      return api.add(contact).then((data) {
        // localStorage.setPremadeMessages([data]);
        return data;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PremadeMessageResponseModel> update({
    required int id,
    required PremadeMessageRequestModel premadeMessage,
  }) {
    try {
      return api.update(id: id, premadeMessage: premadeMessage).then((data) {
        // localStorage.setPremadeMessages([data]);
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
  PremadeMessageResponseDto getPremadeMessages() =>
      localStorage.getPremadeMessages();

  @override
  void setPremadeMessages(PremadeMessageResponseDto contact) =>
      localStorage.setPremadeMessages(contact);
}
