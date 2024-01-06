// Package imports:
import 'package:blinq/data/datasource/local/auth_local_db.dart';
import 'package:blinq/data/datasource/remote/auth_api.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/log_in/bloc/login_bottom_sheet_bloc.dart';
import 'package:blinq/presentation/auth/log_in/bloc/login_bottom_sheet_event.dart';
import 'package:blinq/presentation/auth/log_in/bloc/login_bottom_sheet_state.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'login.mocks.dart';

@GenerateMocks([AuthApi, AuthLocalStorage])
void main() {
  late AuthRepository authRepository;
  late MockAuthApi mockAuthApi;
  late MockAuthLocalStorage mockAuthLocalStorage;

  setUp(() {
    mockAuthApi = MockAuthApi();
    mockAuthLocalStorage = MockAuthLocalStorage();
    authRepository = AuthRepositoryImpl(
      api: mockAuthApi,
      localStorage: mockAuthLocalStorage,
    );
  });

  group(
    'Login bottom sheet bloc',
    () {
      blocTest(
        'when visibility changed',
        build: () => LoginBottomSheetBloc(authRepository: authRepository),
        act: (bloc) => bloc.add(OnPasswordVisibilityChanged()),
        expect: () => [
          const LoginBottomSheetState(
              status: Status.initial, error: null, isCodeVisible: false)
        ],
      );
    },
  );
}
