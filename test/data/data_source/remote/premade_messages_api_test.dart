// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/premade_messages_api.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'premade_messages_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late PremadeMessagesApiImpl premadeMessagesApiImpl;

  const mockRequest = PreMadeMessageRequestModel(
    message: 'Test',
    title: 'Test',
  );

  const mockReponse = PreMadeMessageResponseModel(
    id: 1,
    message: 'Test',
    title: 'Test',
  );

  setUp(() {
    mockApiService = MockAppApi();
    premadeMessagesApiImpl = PremadeMessagesApiImpl(api: mockApiService);
  });

  group('PremadeMessagesApi Tests', () {
    test('fetchList should call api.get with correct parameters', () async {
      // Arrange
      when(mockApiService.get(
        NetworkConstants.premadeMessage,
        queryParameters: {'page': 1},
      )).thenAnswer((_) async => {
            'results': [mockReponse.toJson()],
          });

      // Act
      await premadeMessagesApiImpl.fetchList(1);

      // Assert
      verify(mockApiService.get(
        NetworkConstants.premadeMessage,
        queryParameters: {'page': 1},
      ));
    });

    test('add should call api.post with correct parameters', () async {
      // Arrange
      when(mockApiService.post(
        NetworkConstants.premadeMessage,
        data: mockRequest.toJson(),
      )).thenAnswer((_) async => mockReponse.toJson());

      // Act
      await premadeMessagesApiImpl.add(mockRequest);

      // Assert
      verify(mockApiService.post(
        NetworkConstants.premadeMessage,
        data: mockRequest.toJson(),
      ));
    });
  });

  test('update should call api.put with correct parameters', () async {
    // Arrange
    when(mockApiService.put(
      NetworkConstants.editpremadeMessage(1),
      data: mockRequest.toJson(),
    )).thenAnswer((_) async => mockReponse.toJson());

    // Act
    await premadeMessagesApiImpl.update(id: 1, premadeMessage: mockRequest);

    // Assert
    verify(mockApiService.put(
      NetworkConstants.editpremadeMessage(1),
      data: mockRequest.toJson(),
    ));
  });

  test('delete should call api.delete with correct parameters', () async {
    // Arrange
    when(mockApiService.delete(
      NetworkConstants.editpremadeMessage(1),
    )).thenAnswer((_) async => {});

    // Act
    await premadeMessagesApiImpl.delete(1);

    // Assert
    verify(mockApiService.delete(
      NetworkConstants.editpremadeMessage(1),
    ));
  });
}
