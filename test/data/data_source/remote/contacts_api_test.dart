// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/contacts_api.dart';
import 'package:blinq/data/model/contact/request/contact_request_model.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'contacts_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late ContactsApiImpl contactsApiImpl;

  const id = 1;

  const mockRequest = ContactRequestModel(
    firstName: 'John',
    lastName: 'Doe',
    phoneNumber: '123456789',
    isEmergency: 'true',
  );

  const mockResponse = ContactResponseModel(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    phoneNumber: '123456789',
    isEmergency: true,
  );

  setUp(() {
    mockApiService = MockAppApi();
    contactsApiImpl = ContactsApiImpl(api: mockApiService);
  });

  group('ContactsApi Tests', () {
    test('fetchList should call api.get with correct parameters', () async {
      // Arrange
      when(mockApiService.get(
        NetworkConstants.contact,
        queryParameters: {'page': 1},
      )).thenAnswer((_) async => {
            'results': [mockResponse.toJson()],
          });

      // Act
      await contactsApiImpl.fetchList(1);

      // Assert
      verify(mockApiService.get(
        NetworkConstants.contact,
        queryParameters: {'page': 1},
      ));
    });

    test('add should call api.post with correct parameters', () async {
      // Arrange
      when(mockApiService.post(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await contactsApiImpl.add(
        contact: mockRequest,
      );

      // Assert
      verify(mockApiService.post(
        NetworkConstants.contact,
        data: anyNamed('data'),
      ));
    });

    test('update should call api.put with correct parameters', () async {
      // Arrange
      when(mockApiService.put(any, data: anyNamed('data')))
          .thenAnswer((_) async => mockResponse.toJson());

      // Act
      await contactsApiImpl.update(id: id, contact: mockRequest);

      // Assert
      verify(mockApiService.put(
        NetworkConstants.editContact(1),
        data: anyNamed('data'),
      ));
    });

    test('delete should call api.delete with correct parameters', () async {
      // Arrange
      when(mockApiService.delete(any)).thenAnswer((_) async => {});

      // Act
      await contactsApiImpl.delete(id);

      // Assert
      verify(mockApiService.delete(NetworkConstants.editContact(1)));
    });
  });
}
