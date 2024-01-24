// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

// Project imports:
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/delete_account_sheet/bloc/delete_account_bloc.dart';
import 'package:blinq/presentation/delete_account_sheet/bloc/delete_account_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'delete_account_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DeleteAccountBloc deleteAccountBloc;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    deleteAccountBloc = DeleteAccountBloc(repository: mockRepository);
  });

  group('_onSendCodeDeleteAccount', () {
    const mockCode = '1111';

    test('initial state is correct', () {
      expect(deleteAccountBloc.state, const DeleteAccountState());
    });

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [loading, success] when OnSendCodeDeleteAccount event is added',
      build: () => deleteAccountBloc,
      act: (bloc) => bloc.add(OnSendCodeDeleteAccount()),
      expect: () => [
        const DeleteAccountState(status: Status.loading),
        const DeleteAccountState(status: Status.success),
        const DeleteAccountState(status: Status.initial),
      ],
    );

    blocTest<DeleteAccountBloc, DeleteAccountState>(
      'emits [loading, success] when OnVerifyDeleteAccount event is added',
      build: () => deleteAccountBloc,
      act: (bloc) => bloc.add(OnVerifyDeleteAccount()),
      setUp: () {
        deleteAccountBloc.codeController.text = mockCode;
      },
      expect: () => [
        const DeleteAccountState(status: Status.loading),
        const DeleteAccountState(status: Status.success),
      ],
    );
  });
}
