// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'premade_messages_bloc_test.mocks.dart';

@GenerateMocks([PremadeMessagesRepository])
void main() {
  late PreMadeMessagesBloc preMadeMessagesBloc;
  late MockPremadeMessagesRepository mockRepository;

  setUp(() {
    mockRepository = MockPremadeMessagesRepository();
    preMadeMessagesBloc = PreMadeMessagesBloc(repository: mockRepository);
  });

  tearDown(() {
    preMadeMessagesBloc.close();
  });

  group('PreMadeMessagesBloc', () {
    test('initial state is correct', () {
      expect(preMadeMessagesBloc.state, const PreMadeMessagesState());
    });

    blocTest<PreMadeMessagesBloc, PreMadeMessagesState>(
      'emits [loading, success] when OnFetchPreMadeMessages event is added',
      build: () {
        when(mockRepository.fetchList()).thenAnswer(
          (_) async => const PreMadeMessageResponseDto(),
        );
        return preMadeMessagesBloc;
      },
      act: (bloc) => bloc.add(OnFetchPreMadeMessages()),
      expect: () => [
        const PreMadeMessagesState(status: Status.loading),
        const PreMadeMessagesState(
          premadeMessages: PreMadeMessageResponseDto(),
          status: Status.success,
        ),
      ],
    );

    blocTest<PreMadeMessagesBloc, PreMadeMessagesState>(
      'emits [loading, failure] when OnFetchPreMadeMessages event fails',
      build: () {
        when(mockRepository.fetchList()).thenThrow(Exception('Fetch failed'));
        return preMadeMessagesBloc;
      },
      act: (bloc) => bloc.add(OnFetchPreMadeMessages()),
      expect: () => [
        const PreMadeMessagesState(status: Status.loading),
        const PreMadeMessagesState(status: Status.initial),
      ],
    );
  });
}
