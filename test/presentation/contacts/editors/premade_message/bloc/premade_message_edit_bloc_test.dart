// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/request/premade_message_request_model.dart';
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/presentation/contacts/editors/premage_message/bloc/premade_message_edit_bloc.dart';
import 'package:blinq/presentation/contacts/editors/premage_message/bloc/premade_message_edit_event.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'premade_message_edit_bloc_test.mocks.dart';

@GenerateMocks([PremadeMessagesRepository, PreMadeMessagesBloc])
void main() {
  late PremadeMessageEditorBloc premadeMessageEditorBloc;
  late MockPreMadeMessagesBloc preMadeMessagesBloc;
  late MockPremadeMessagesRepository mockRepository;

  setUp(() {
    mockRepository = MockPremadeMessagesRepository();
    preMadeMessagesBloc = MockPreMadeMessagesBloc();
    premadeMessageEditorBloc = PremadeMessageEditorBloc(
      repository: mockRepository,
      preMadeMessagesBloc: preMadeMessagesBloc,
    );
  });

  tearDown(() {
    premadeMessageEditorBloc.close();
  });

  group('PremadeMessageEditorBloc', () {
    test('initial state is correct', () {
      expect(premadeMessageEditorBloc.state, const PreMadeMessageEditorState());
    });

    test('emits [loading, success] when OnAddPreMadeMessage event is added',
        () {
      when(mockRepository.add(
        const PreMadeMessageRequestModel(
          title: 'title',
          message: 'message',
        ),
      )).thenAnswer(
        (_) async => const PreMadeMessageResponseModel(),
      );
      expect(
        premadeMessageEditorBloc.stream,
        emitsInOrder([
          const PreMadeMessageEditorState(status: Status.loading),
          const PreMadeMessageEditorState(status: Status.initial),
        ]),
      );
      premadeMessageEditorBloc.add(OnAddPreMadeMessage());
    });

    test('emits [loading, success] when OnUpdatePremadeMessage event is added',
        () {
      when(mockRepository.update(
        id: 1,
        premadeMessage: anyNamed('premadeMessage'),
      )).thenAnswer(
        (_) async => const PreMadeMessageResponseModel(),
      );
      expectLater(
        premadeMessageEditorBloc.stream,
        emitsInOrder([
          const PreMadeMessageEditorState(status: Status.loading),
          const PreMadeMessageEditorState(status: Status.success),
          const PreMadeMessageEditorState(status: Status.initial),
        ]),
      );
      premadeMessageEditorBloc.add(OnUpdatePreMadeMessage(id: 1));
    });

    test('emits [loading, success] when OnDeletePremadeMessage event is added',
        () {
      when(mockRepository.delete(1)).thenAnswer(
        (_) async => const PreMadeMessageResponseModel(),
      );
      expectLater(
        premadeMessageEditorBloc.stream,
        emitsInOrder([
          const PreMadeMessageEditorState(status: Status.loading),
          const PreMadeMessageEditorState(status: Status.success),
          const PreMadeMessageEditorState(status: Status.initial),
        ]),
      );
      premadeMessageEditorBloc.add(OnDeletePreMadeMessage(id: 1));
    });
  });
}
