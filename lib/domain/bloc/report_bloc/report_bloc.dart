import 'package:blinq/core/network/custom_error.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/location_info/location_info_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/location/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportBloc extends Cubit<GenericBlocState> {
  final AccidentRepository accidentRepository;

  ReportType _reportType = ReportType.accident;
  int _progress = 0;
  int _accidentId = 0;

  ReportBloc({
    required this.accidentRepository,
  }) : super(const GenericBlocState(status: Status.initial));

  setReportType(ReportType type) => _reportType = type;

  ReportType get reportType => _reportType;

  setProgress(int progress) => _progress = progress;

  int get progress => _progress;

  setAccidentId(int accidentId) => _accidentId = accidentId;

  int get accidentId => _accidentId;

  Future<String?> onCreateReport() async {
    final position = await LocationService.determinePosition();

    if (position == null) return null;

    try {
      final accidentId = await accidentRepository.createAccident(
          position.longitude.toString(), position.latitude.toString());
      setAccidentId(accidentId);
      return LocationInfoScreen.route;
    } catch (e) {
      if (e is HaveActiveReportException) {
        ///one more api to get step
        ///switch
        ///return route

        print('id is ${e.accidentId}');
        return LocationInfoScreen.route;
      }
    }

    return null;
  }
}


