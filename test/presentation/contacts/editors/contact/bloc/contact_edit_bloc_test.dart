// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/presentation/contacts/editors/contact/bloc/contact_edit_bloc.dart';
import 'package:blinq/presentation/contacts/editors/contact/bloc/contact_edit_event.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'contact_edit_bloc_test.mocks.dart';

@GenerateMocks([ContactsRepository, MediaService, ContactsBloc])
void main() {
  late ContactEditBloc contactEditBloc;
  MockContactsBloc mockContactsBloc;
  MockContactsRepository mockRepository;
  MockMediaService mockMediaService;

  setUp(() {
    mockRepository = MockContactsRepository();
    mockMediaService = MockMediaService();
    mockContactsBloc = MockContactsBloc();

    contactEditBloc = ContactEditBloc(
      contactsBloc: mockContactsBloc,
      repository: mockRepository,
      mediaService: mockMediaService,
    );
  });

  tearDown(() {
    contactEditBloc.close();
  });

  group('ContactEditBloc', () {
    test('initial state is correct', () {
      expect(contactEditBloc.state, const ContactEditState());
    });

    blocTest<ContactEditBloc, ContactEditState>(
      'emits [loading, success] when OnAddContact event is added',
      build: () => contactEditBloc,
      act: (bloc) => bloc.add(OnAddContact()),
      expect: () => [
        const ContactEditState(status: Status.loading),
        const ContactEditState(status: Status.initial),
      ],
    );
  });
}
