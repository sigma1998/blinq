// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/accident_api.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'accident_repository_test.mocks.dart';

@GenerateMocks([AccidentApi])
void main() {
  late MockAccidentApi mockAccidentApi;
  late AccidentRepository accidentRepository;

  setUp(() {
    mockAccidentApi = MockAccidentApi();
    accidentRepository = AccidentRepositoryImpl(
      api: mockAccidentApi,
    );
  });
}
