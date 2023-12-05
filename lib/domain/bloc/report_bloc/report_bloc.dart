import 'package:blinq/core/network/custom_error.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/report/pages/circumstances/circumstances_screen.dart';
import 'package:blinq/presentation/report/pages/connect_to_driver/connect_to_driver_screen.dart';
import 'package:blinq/presentation/report/pages/damaged_media/damaged_media_screen.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/presentation/report/pages/injury/injury_screen.dart';
import 'package:blinq/presentation/report/pages/location_info/location_info_screen.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/report/pages/sign/sign_screen.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/location/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportBloc extends Cubit<GenericBlocState> {
  final AccidentRepository accidentRepository;
  final ProfileBloc profileBloc;

  ReportType _reportType = ReportType.accident;
  User _user = User.A;

  int _progress = 0;
  int _reportId = 0;

  ReportBloc({required this.accidentRepository, required this.profileBloc})
      : super(const GenericBlocState(status: Status.initial));

  setReportType(ReportType type) => _reportType = type;

  ReportType get reportType => _reportType;

  setProgress(int progress) => _progress = progress;

  int get progress => _progress;

  setReportId(int reportId) => _reportId = reportId;

  int get reportId => _reportId;

  setUser(User user) => _user = user;

  User get user => _user;

  VehicleType get aDriverVehicleType =>
      profileBloc.vehicleType ?? VehicleType.auto;

  Future<RouteAndArgs?> onCreateReport() async {
    final position = await LocationService.determinePosition();

    if (position == null) return null;

    try {
      _user = User.A;
      final accidentId = await accidentRepository.createAccident(
          position.longitude.toString(), position.latitude.toString());
      setReportId(accidentId);
      return RouteAndArgs(route: LocationInfoScreen.route);
    } catch (e) {
      if (e is HaveActiveReportException) {
        setReportId(e.accidentId);

        final res = await accidentRepository.getAccidentStep(reportId);

        if (res.split('/').first == 'adriver') {
          setUser(User.A);
        }
        if (res.split('/').first == 'bdriver') {
          setUser(User.B);
        }

        final step = '/v2/api/$res';


        if (step == NetworkConstants.accidentTimeAndPlace(reportId)) {
          return RouteAndArgs(route: LocationInfoScreen.route);
        } else if (step == NetworkConstants.injury(reportId)) {
          return RouteAndArgs(route: InjuryScreen.route);
        } else if (step == NetworkConstants.witnesses(reportId)) {
          return RouteAndArgs(
              route: SpeechToTextScreen.route,
              args: SpeechToTextArgs(mode: SpeechToTextScreenMode.witnesses));
        } else if (step == NetworkConstants.initialImpactPoint(reportId) ||
            step == NetworkConstants.initialImpactPointB(reportId)) {
          return RouteAndArgs(route: PointsOfImpactScreen.route);
        } else if (step == NetworkConstants.visibleDamage(reportId) ||
            step == NetworkConstants.visibleDamageB(reportId)) {
          return RouteAndArgs(
              route: SpeechToTextScreen.route,
              args:
                  SpeechToTextArgs(mode: SpeechToTextScreenMode.visibleDamage));
        } else if (step == NetworkConstants.myRemarks(reportId) ||
            step == NetworkConstants.myRemarksB(reportId)) {
          return RouteAndArgs(
              route: SpeechToTextScreen.route,
              args: SpeechToTextArgs(mode: SpeechToTextScreenMode.remarks));
        } else if (step == NetworkConstants.damagePoints(reportId)) {
          return RouteAndArgs(
              route: DamagedPartsScreen.route,
              args: DamagedPartsScreenArgs(vehicleType: aDriverVehicleType));
        } else if (step == NetworkConstants.damagePointsB(reportId)) {
          final vehicleType =
              await accidentRepository.getSecondDriverVehicleType(reportId);
          return RouteAndArgs(
              route: DamagedPartsScreen.route,
              args: DamagedPartsScreenArgs(vehicleType: vehicleType));
        } else if (step == NetworkConstants.uploadMedia(reportId) ||
            step == NetworkConstants.uploadMediaB(reportId)) {
          return RouteAndArgs(route: DamagedMediaScreen.route);
        } else if (step == NetworkConstants.connectBDriver(reportId)) {
          return RouteAndArgs(route: ConnectToDriverScreen.route);
        } else if (step == NetworkConstants.accidentCircumstances(reportId) ||
            step == NetworkConstants.accidentStatus(reportId)) {
          return RouteAndArgs(route: CircumstancesScreen.route);
        } else if (step == NetworkConstants.sign(reportId)) {
          return RouteAndArgs(
              route: SignScreen.route, args: SignScreenArgs(user: User.A));
        } else if (step == NetworkConstants.signB(reportId)) {
          return RouteAndArgs(
              route: SignScreen.route, args: SignScreenArgs(user: User.B));
        } else if (step == NetworkConstants.updateCarB(reportId) ||
            step == NetworkConstants.updateDriverB(reportId) ||
            step == NetworkConstants.updateInsuranceCompanyB(reportId) ||
            step == NetworkConstants.updatePolicyHolderB(reportId)) {
          return RouteAndArgs(
            route: ConnectToDriverScreen.route,
          );
        }

        return RouteAndArgs(route: LocationInfoScreen.route);
      }
    }

    return null;
  }
}

class RouteAndArgs {
  final String route;
  final dynamic args;

  RouteAndArgs({required this.route, this.args});
}
