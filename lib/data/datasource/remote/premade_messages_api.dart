// Project imports:
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/core/network/api_service.dart';

abstract class PremadeMessagesApi {
  //
  Future<PremadeMessageResponseDto> fetchList([int count]);

  Future<PremadeMessageResponseModel> add(
    PremadeMessageRequestModel premadeMessage,
  );

  Future<PremadeMessageResponseModel> update({
    required int id,
    required PremadeMessageRequestModel premadeMessage,
  });

  Future<void> delete(int id);
}

class PremadeMessagesApiImpl implements PremadeMessagesApi {
  //
  final AppApi api;

  PremadeMessagesApiImpl({required this.api});

  @override
  Future<PremadeMessageResponseDto> fetchList([int page = 1]) async {
    try {
      final res = await api.get(NetworkConstants.premadeMessage,
          queryParameters: {'page': page});
      return PremadeMessageResponseDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PremadeMessageResponseModel> add(
    PremadeMessageRequestModel premadeMessage,
  ) {
    try {
      return api
          .post(NetworkConstants.premadeMessage, data: premadeMessage.toJson())
          .then((data) {
        return PremadeMessageResponseModel.fromJson(data);
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
      return api
          .put(NetworkConstants.editpremadeMessage(id),
              data: premadeMessage.toJson())
          .then((data) {
        return PremadeMessageResponseModel.fromJson(data);
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
