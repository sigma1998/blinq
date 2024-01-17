import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/presentation/contacts/editors/premage_message/bloc/premade_message_edit_bloc.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'premade_message_edit_bloc_test.mocks.dart';

@GenerateMocks([PremadeMessagesRepository, PreMadeMessagesBloc])
void main() {
  late PremadeMessageEditorBloc premadeMessageEditorBloc;
  MockPreMadeMessagesBloc preMadeMessagesBloc;
  MockPremadeMessagesRepository mockRepository;

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
}
