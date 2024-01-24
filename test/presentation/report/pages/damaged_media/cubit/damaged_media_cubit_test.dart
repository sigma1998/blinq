// Dart imports:
import 'dart:io';

// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/damaged_media/cubit/damaged_media_cubit.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'damaged_media_cubit_test.mocks.dart';

@GenerateMocks([
  ReportBloc,
  AccidentRepository,
  BreakdownRepository,
  MediaService,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late DamagedMediaCubit damagedMediaCubit;
  late MockReportBloc mockReportBloc;
  late MockAccidentRepository mockAccidentRepository;
  late MockBreakdownRepository mockBreakdownRepository;
  late MockMediaService mockMediaService;

  final image = File('assets/images/welcome.png');

  setUp(() {
    mockReportBloc = MockReportBloc();
    mockAccidentRepository = MockAccidentRepository();
    mockBreakdownRepository = MockBreakdownRepository();
    mockMediaService = MockMediaService();

    damagedMediaCubit = DamagedMediaCubit(
      reportBloc: mockReportBloc,
      accidentRepository: mockAccidentRepository,
      breakdownRepository: mockBreakdownRepository,
      mediaService: mockMediaService,
    );
  });

  tearDown(() {
    damagedMediaCubit.close();
  });

  group('DamagedMediaCubit', () {
    test('initial state is correct', () {
      expect(damagedMediaCubit.state, const DamagedMediaState());
    });

    blocTest<DamagedMediaCubit, DamagedMediaState>(
      'emits [loading, success] when OnUploadDamagedMediaFiles event is added',
      build: () => damagedMediaCubit,
      act: (bloc) async {
        await bloc.onUploadDamagedMediaFiles();
      },
      expect: () => [
        const DamagedMediaState(status: Status.initial),
      ],
    );

    blocTest<DamagedMediaCubit, DamagedMediaState>(
      'uploadFiles adds files to uploadedFilesId',
      build: () => damagedMediaCubit,
      act: (bloc) async {
        bloc.emit(bloc.state.copyWith(files: [image]));

        // Stub the uploadFile method
        when(mockAccidentRepository.uploadFile(file: anyNamed('file')))
            .thenAnswer((_) async => 1);

        await bloc.uploadFiles();
      },
      expect: () => [
        DamagedMediaState(
          status: Status.initial,
          files: [image],
        ),
        DamagedMediaState(
          status: Status.initial,
          files: [image],
          uploadedFilesId: [1],
        ),
      ],
    );

    blocTest<DamagedMediaCubit, DamagedMediaState>(
      'removeDamagedMediaPressed removes file from files',
      build: () => damagedMediaCubit,
      act: (bloc) async {
        bloc.emit(bloc.state.copyWith(files: [image]));

        await bloc.removeDamagedMediaPressed(image);
      },
      expect: () => [
        DamagedMediaState(
          status: Status.initial,
          files: [image],
        ),
        DamagedMediaState(
          status: Status.loading,
          files: [image],
        ),
        const DamagedMediaState(status: Status.success),
      ],
    );
  });
}
