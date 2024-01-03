// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/premade_messages_api.dart';
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'premade_messages_repository_test.mocks.dart';

@GenerateMocks([PremadeMessagesApi])
void main() {
  late PremadeMessagesRepository premadeMessagesRepository;
  late MockPremadeMessagesApi mockPremadeMessagesApi;

  const id = 1;

  const requestModel =
      PreMadeMessageRequestModel(message: 'Updated Message', title: '');

  const responseModel = PreMadeMessageResponseModel(
    title: 'ds',
    message: '',
  );

  setUp(() {
    mockPremadeMessagesApi = MockPremadeMessagesApi();
    premadeMessagesRepository = PremadeMessagesRepositoryImpl(
      api: mockPremadeMessagesApi,
    );
  });

  group('Premade Messages repository test', () {
    test('fetchList calls api.fetchList with correct parameters', () async {
      // Arrange
      when(mockPremadeMessagesApi.fetchList()).thenAnswer(
        (_) async => const PreMadeMessageResponseDto(results: [responseModel]),
      );

      // Act
      await premadeMessagesRepository.fetchList();

      // Assert
      verify(mockPremadeMessagesApi.fetchList());
    });

    test('add calls api.add with correct parameters', () async {
      // Arrange
      when(mockPremadeMessagesApi.add(any))
          .thenAnswer((_) async => responseModel);

      // Act
      await premadeMessagesRepository.add(requestModel);

      // Assert
      verify(mockPremadeMessagesApi.add(requestModel));
    });

    test('update calls api.update with correct parameters', () async {
      // Arrange
      when(mockPremadeMessagesApi.update(id: id, premadeMessage: requestModel))
          .thenAnswer((_) async => responseModel);

      // Act
      await premadeMessagesRepository.update(
          id: id, premadeMessage: requestModel);

      // Assert
      verify(
          mockPremadeMessagesApi.update(id: id, premadeMessage: requestModel));
    });

    test('delete calls api.delete with correct parameters', () async {
      // Arrange
      when(mockPremadeMessagesApi.delete(any)).thenAnswer((_) async {});

      // Act
      await premadeMessagesRepository.delete(id);

      // Assert
      verify(mockPremadeMessagesApi.delete(id));
    });
  });
}
