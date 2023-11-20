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
  Future<PreMadeMessageResponseDto> fetchList();

  Future<PreMadeMessageResponseModel> add(
    PreMadeMessageRequestModel premadeMessage,
  );

  Future<PreMadeMessageResponseModel> update({
    required int id,
    required PreMadeMessageRequestModel premadeMessage,
  });

  Future<void> delete(int id);

  ///
  /// Local storage
  ///

  PreMadeMessageResponseDto getPremadeMessages();

  void setPremadeMessages(PreMadeMessageResponseDto premadeMessage);
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
  Future<PreMadeMessageResponseDto> fetchList() async {
    try {
      return await api.fetchList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PreMadeMessageResponseModel> add(PreMadeMessageRequestModel contact) {
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
  Future<PreMadeMessageResponseModel> update({
    required int id,
    required PreMadeMessageRequestModel premadeMessage,
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
  PreMadeMessageResponseDto getPremadeMessages() =>
      localStorage.getPremadeMessages();

  @override
  void setPremadeMessages(PreMadeMessageResponseDto contact) =>
      localStorage.setPremadeMessages(contact);
}
