// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';

abstract class PremadeMessagesApi {
  //
  Future<PreMadeMessageResponseDto> fetchList([int count]);

  Future<PreMadeMessageResponseModel> add(
    PreMadeMessageRequestModel premadeMessage,
  );

  Future<PreMadeMessageResponseModel> update({
    required int id,
    required PreMadeMessageRequestModel premadeMessage,
  });

  Future<void> delete(int id);
}

class PremadeMessagesApiImpl implements PremadeMessagesApi {
  //
  final AppApi api;

  PremadeMessagesApiImpl({required this.api});

  @override
  Future<PreMadeMessageResponseDto> fetchList([int page = 1]) async {
    try {
      final res = await api.get(NetworkConstants.premadeMessage,
          queryParameters: {'page': page});
      return PreMadeMessageResponseDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PreMadeMessageResponseModel> add(
    PreMadeMessageRequestModel premadeMessage,
  ) {
    try {
      return api
          .post(NetworkConstants.premadeMessage, data: premadeMessage.toJson())
          .then((data) {
        return PreMadeMessageResponseModel.fromJson(data);
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
      return api
          .put(NetworkConstants.editpremadeMessage(id),
              data: premadeMessage.toJson())
          .then((data) {
        return PreMadeMessageResponseModel.fromJson(data);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      return api.delete(NetworkConstants.editpremadeMessage(id));
    } catch (e) {
      rethrow;
    }
  }
}
