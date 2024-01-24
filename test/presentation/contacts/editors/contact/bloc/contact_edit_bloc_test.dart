// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/presentation/contacts/editors/contact/bloc/contact_edit_bloc.dart';
import 'package:blinq/presentation/contacts/editors/contact/bloc/contact_edit_event.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'contact_edit_bloc_test.mocks.dart';

@GenerateMocks([
  ContactsBloc,
  ContactsRepository,
  MediaService,
])
void main() {
  late ContactEditBloc contactEditBloc;
  late MockContactsBloc mockContactsBloc;
  late MockContactsRepository mockRepository;
  late MockMediaService mockMediaService;

  setUp(() {
    mockContactsBloc = MockContactsBloc();
    mockRepository = MockContactsRepository();
    mockMediaService = MockMediaService();

    contactEditBloc = ContactEditBloc(
      contactsBloc: mockContactsBloc,
      repository: mockRepository,
      mediaService: mockMediaService,
    );
  });

  group('ContactEditBloc', () {
    test('initial state is correct', () {
      expect(contactEditBloc.state, const ContactEditState());
    });

    blocTest<ContactEditBloc, ContactEditState>(
      'emits [loading, success] when OnAddContact event is added',
      build: () {
        when(mockRepository.add(
          contact: anyNamed('contact'),
          file: anyNamed('file'),
        )).thenAnswer(
          (_) async => const ContactResponseModel(),
        );
        return contactEditBloc;
      },
      act: (bloc) => bloc.add(OnAddContact()),
      expect: () => [
        const ContactEditState(status: Status.loading),
        const ContactEditState(status: Status.success),
        const ContactEditState(status: Status.initial),
      ],
    );

    blocTest<ContactEditBloc, ContactEditState>(
      'emits [loading, success] when OnUpdateContact event is added',
      build: () {
        when(mockRepository.update(
          id: anyNamed('id'),
          contact: anyNamed('contact'),
          file: anyNamed('file'),
        )).thenAnswer(
          (_) async => const ContactResponseModel(),
        );
        return contactEditBloc;
      },
      act: (bloc) => bloc.add(OnUpdateContact(id: 1)),
      expect: () => [
        const ContactEditState(status: Status.loading),
        const ContactEditState(status: Status.success),
        const ContactEditState(status: Status.initial),
      ],
    );

    blocTest<ContactEditBloc, ContactEditState>(
      'emits [loading, success] when OnDeleteContact event is added',
      build: () {
        when(mockRepository.delete(any)).thenAnswer(
          (_) async => const ContactResponseModel(),
        );
        return contactEditBloc;
      },
      act: (bloc) => bloc.add(OnDeleteContact(id: 1)),
      expect: () => [
        const ContactEditState(status: Status.loading),
        const ContactEditState(status: Status.success),
        const ContactEditState(status: Status.initial),
      ],
    );
  });
}
