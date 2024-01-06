// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/data/datasource/remote/breakdown_api.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'breakdown_repository_test.mocks.dart';

@GenerateMocks([BreakdownApi])
void main() {
  late MockBreakdownApi mockBreakdownApi;
  late BreakdownRepository breakdownRepository;

  setUp(() {
    mockBreakdownApi = MockBreakdownApi();
    breakdownRepository = BreakdownRepositoryImpl(
      breakdownApi: mockBreakdownApi,
    );
  });
}
