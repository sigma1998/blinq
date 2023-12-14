import 'package:blinq/core/network/custom_error.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc_state.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
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
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/location/location_service.dart';
import 'package:blinq/utils/smart_widgets/dialogs/unifnished_report_dialog/unfinished_report_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class ReportBloc extends Cubit<ReportState> {
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;
  final ProfileBloc profileBloc;

  ReportType _reportType = ReportType.accident;

  int _reportId = 0;

  ReportBloc({required this.accidentRepository,
    required this.breakdownRepository,
    required this.profileBloc})
      : super(const ReportState());

  setReportType(ReportType type) => _reportType = type;

  ReportType get reportType => _reportType;

  setReportId(int reportId) => _reportId = reportId;

  int get reportId => _reportId;

  setUser(User user) {
    emit(state.copyWith(user: user));
  }

  VehicleType get aDriverVehicleType =>
      profileBloc.vehicleType ?? VehicleType.auto;

  Future<RouteAndArgs?> onCreateReport() async {
    final position = await LocationService.determinePosition();

    if (position == null) return null;

    try {
      if (reportType == ReportType.accident) {
        return await _createAccident(position);
      } else {
        return await _createBreakdown(position);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<RouteAndArgs?> getReportStep(int accidentId,
      ReportType reportType) async {
    setReportId(accidentId);

    final String res;
    if (reportType == ReportType.accident) {
      res = await accidentRepository.getAccidentStep(reportId);
    } else {
      res = await breakdownRepository.getBreakdownStep(reportId);
    }

    if (res
        .split('/')
        .first == 'adriver') {
      setUser(User.A);
    }
    if (res
        .split('/')
        .first == 'bdriver') {
      setUser(User.B);
    }
    if (res
        .split('/')
        .first == 'breakdown') {
      setReportType(ReportType.breakdown);
    }

    final step = '/v2/api/$res';

    if (step == NetworkConstants.accidentTimeAndPlace(reportId) ||
        step == NetworkConstants.breakdownTimeAndPlace(reportId)) {
      return RouteAndArgs(route: LocationInfoScreen.route);
    } else if (step == NetworkConstants.injury(reportId) ||
        step == NetworkConstants.injuryBreakdown(reportId)) {
      return RouteAndArgs(route: InjuryScreen.route);
    } else if (step == NetworkConstants.witnesses(reportId) ||
        step == NetworkConstants.witnessesBreakdown(reportId)) {
      return RouteAndArgs(
          route: SpeechToTextScreen.route,
          args: SpeechToTextArgs(mode: SpeechToTextScreenMode.witnesses));
    } else if (step == NetworkConstants.initialImpactPoint(reportId) ||
        step == NetworkConstants.initialImpactPointB(reportId) ||
        step == NetworkConstants.initialImpactPointBreakdown(reportId)) {
      return RouteAndArgs(route: PointsOfImpactScreen.route);
    } else if (step == NetworkConstants.visibleDamage(reportId) ||
        step == NetworkConstants.visibleDamageB(reportId) ||
        step == NetworkConstants.visibleDamageBreakdown(reportId)) {
      return RouteAndArgs(
          route: SpeechToTextScreen.route,
          args: SpeechToTextArgs(mode: SpeechToTextScreenMode.visibleDamage));
    } else if (step == NetworkConstants.myRemarks(reportId) ||
        step == NetworkConstants.myRemarksB(reportId) ||
        step == NetworkConstants.myRemarksBreakdown(reportId)) {
      return RouteAndArgs(
          route: SpeechToTextScreen.route,
          args: SpeechToTextArgs(mode: SpeechToTextScreenMode.remarks));
    } else if (step == NetworkConstants.damagePoints(reportId) ||
        step == NetworkConstants.damagePointsBreakdown(reportId)) {
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
        step == NetworkConstants.uploadMediaB(reportId) ||
        step == NetworkConstants.uploadMediaBreakdown(reportId)) {
      return RouteAndArgs(route: DamagedMediaScreen.route);
    } else if (step == NetworkConstants.connectBDriver(reportId)) {
      return RouteAndArgs(route: ConnectToDriverScreen.route);
    } else if (step == NetworkConstants.accidentCircumstances(reportId) ||
        step == NetworkConstants.breakdownCircumstances(reportId)) {
      return RouteAndArgs(route: CircumstancesScreen.route);
    } else if (step == NetworkConstants.sign(reportId) ||
        step == NetworkConstants.signBreakdown(reportId)) {
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

  Future<RouteAndArgs?> _createAccident(Position position) async {
    try {
      setUser(User.A);
      final accidentId = await accidentRepository.createAccident(
          position.longitude.toString(), position.latitude.toString());
      setReportId(accidentId);
      return RouteAndArgs(route: LocationInfoScreen.route);
    } catch (e) {
      if (e is HaveActiveReportException) {
        setReportId(e.id);

        final bool? res = await NavigationService.showDialog(
            dialog: UnfinishedReportDialog(
              dateTime: e.createdAt,
            ));

        if (res == null) {
          return RouteAndArgs(route: '');
        }

        if (res) {
          return await getReportStep(e.id,
              e.reportType == 'breakdown' ? ReportType.breakdown : ReportType
                  .accident);
        } else {
          if (e.reportType == 'breakdown') {
            await breakdownRepository.deactivateBreakdown(e.id);
          } else {
            await accidentRepository.deactivateAccident(e.id);
          }

          return await _createAccident(position);
        }
      }
    }
    return null;
  }

  Future<RouteAndArgs?> _createBreakdown(Position position) async {
    try {
      final accidentId = await breakdownRepository.createBreakdown(
          position.longitude.toString(), position.latitude.toString());
      setReportId(accidentId);
      return RouteAndArgs(route: LocationInfoScreen.route);
    } catch (e) {
      if (e is HaveActiveReportException) {
        setReportId(e.id);

        final bool? res = await NavigationService.showDialog(
            dialog: UnfinishedReportDialog(
              dateTime: e.createdAt,
            ));

        if (res == null) {
          return RouteAndArgs(route: '');
        }

        if (res) {
          setReportType(e.reportType == 'breakdown' ? ReportType.breakdown : ReportType.accident);
          return await getReportStep(e.id,
              e.reportType == 'breakdown' ? ReportType.breakdown : ReportType
                  .accident);
        } else {
          if (e.reportType == 'breakdown') {
            await breakdownRepository.deactivateBreakdown(e.id);
          } else {
            await accidentRepository.deactivateAccident(e.id);
          }
          return await _createBreakdown(position);
        }
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
