// Dart imports:
import 'dart:io';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/contacts_api.dart';
import 'package:blinq/data/model/contact/contact_response_dto.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'contacts_repository_test.mocks.dart';

@GenerateMocks([ContactsApi])
void main() {
  late MockContactsApi mockContactsApi;
  late ContactsRepository contactsRepository;

  const id = 1;

  const requestModel = ContactRequestModel(
    firstName: 'John',
    lastName: 'Doe',
    phoneNumber: '123',
  );

  const responseModel = ContactResponseModel(
    id: 1,
    image: '',
    firstName: 'John',
    lastName: 'Doe',
    phoneNumber: '123',
  );

  final file = File('mockFilePath');

  setUp(() {
    mockContactsApi = MockContactsApi();
    contactsRepository = ContactsRepositoryImpl(
      api: mockContactsApi,
    );
  });

  group('Contacts Repository test', () {
    test('fetchList calls api.fetchList with correct parameters', () async {
      // Arrange
      const page = 1;
      when(mockContactsApi.fetchList(any)).thenAnswer(
          (_) async => const ContactResponseDto(results: [responseModel]));

      // Act
      final result = await contactsRepository.fetchList(page);

      // Assert
      expect(result, isA<ContactResponseDto>());
      verify(mockContactsApi.fetchList(page));
    });

    test('add calls api.add with correct parameters', () async {
      // Arrange
      when(mockContactsApi.add(contact: requestModel, file: file))
          .thenAnswer((_) async => responseModel);

      // Act
      final result =
          await contactsRepository.add(contact: requestModel, file: file);

      // Assert
      expect(result, isA<ContactResponseModel>());
      verify(mockContactsApi.add(contact: requestModel, file: file));
    });

    test('update calls api.update with correct parameters', () async {
      // Arrange
      when(mockContactsApi.update(id: id, contact: requestModel, file: file))
          .thenAnswer((_) async => responseModel);

      // Act
      final result = await contactsRepository.update(
        id: id,
        contact: requestModel,
        file: file,
      );

      // Assert
      expect(result, isA<ContactResponseModel>());
      verify(mockContactsApi.update(id: id, contact: requestModel, file: file));
    });

    test('delete calls api.delete with correct parameters', () async {
      // Arrange
      const id = 1;
      when(mockContactsApi.delete(any)).thenAnswer((_) async {});

      // Act
      await contactsRepository.delete(id);

      // Assert
      verify(mockContactsApi.delete(id));
    });
  });
}
