// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/emergency_services/emergency_services_screen.dart';
import 'package:blinq/presentation/inform_close_ones/inform_close_ones_screen.dart';
import 'package:blinq/presentation/medical_assistance/medical_assistance_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/driver/driver_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/insurance/insurance_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/policy_holder/policy_holder_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/vehicle/vehicle_editor_screen.dart';
import 'package:blinq/presentation/report/pages/location_info/location_info_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/location/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateReportBloc extends Cubit<GenericBlocState> {
  final ProfileRepository profileRepository;
  final AccidentRepository accidentRepository;
  final ReportBloc reportBloc;

  CreateReportBloc(
      {required this.profileRepository,
      required this.accidentRepository,
      required this.reportBloc})
      : super(const GenericBlocState(status: Status.initial));

//
  void onMedicalAssistancePressed() =>
      NavigationService.pushNamed(routeName: MedicalAssistanceScreen.route);

  void onEmergencyServicesPressed() =>
      NavigationService.pushNamed(routeName: EmergencyServicesScreen.route);

  void onInformYourCloseOnesPressed() =>
      NavigationService.pushNamed(routeName: InformCloseOnesScreen.route);

  void onCreateReportPressed() async {
    emit(const GenericBlocState(status: Status.loading));
    final data = await profileRepository.checkAccountData();
    emit(const GenericBlocState(status: Status.initial));

    if (data.account == false) {
      NavigationService.pushNamed(routeName: DriverEditorScreen.route);
    } else if (data.car == false) {
      NavigationService.pushNamed(routeName: VehicleEditorScreen.route);
    } else if (data.policyHolder == false) {
      NavigationService.pushNamed(routeName: PolicyHolderEditorScreen.route);
    } else if (data.insurance == false) {
      NavigationService.pushNamed(routeName: InsuranceEditorScreen.route);
    }

    final position = await LocationService.determinePosition();

    if (position == null) return;

    final accidentId = await accidentRepository.createAccident(
        position.longitude.toString(), position.latitude.toString());

    reportBloc.setAccidentId(accidentId);

    NavigationService.pushNamed(
        routeName: LocationInfoScreen.route,
        nestedKey: NavigationService.homeNavigatorKey);
  }
}
