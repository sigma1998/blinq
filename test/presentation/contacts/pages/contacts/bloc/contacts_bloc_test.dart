import 'package:blinq/data/model/contact/contact_response_dto.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'contacts_bloc_test.mocks.dart';

@GenerateMocks([ContactsRepository])
void main() {
  late ContactsBloc contactsBloc;
  late MockContactsRepository mockRepository;

  setUp(() {
    mockRepository = MockContactsRepository();
    contactsBloc = ContactsBloc(repository: mockRepository);
  });

  tearDown(() {
    contactsBloc.close();
  });

  group('ContactsBloc', () {
    test('initial state is correct', () {
      expect(contactsBloc.state, const ContactsState());
    });

    blocTest<ContactsBloc, ContactsState>(
      'emits [loading, success] when OnFetchContacts event is added',
      build: () {
        when(mockRepository.fetchList()).thenAnswer(
          (_) async => const ContactResponseDto(),
        );
        return contactsBloc;
      },
      act: (bloc) => bloc.add(OnFetchContacts()),
      expect: () => [
        const ContactsState(status: Status.loading),
        const ContactsState(
          contacts: ContactResponseDto(),
          status: Status.success,
        ),
      ],
    );

    blocTest<ContactsBloc, ContactsState>(
      'emits [loading, failure] when OnFetchContacts event fails',
      build: () {
        when(mockRepository.fetchList()).thenThrow(Exception('Fetch failed'));
        return contactsBloc;
      },
      act: (bloc) => bloc.add(OnFetchContacts()),
      expect: () => [
        const ContactsState(status: Status.loading),
        const ContactsState(status: Status.initial),
      ],
    );
  });
}
