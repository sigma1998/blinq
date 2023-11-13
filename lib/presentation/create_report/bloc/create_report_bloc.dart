// Project imports:
import 'package:blinq/presentation/emergency_services/emergency_services_screen.dart';
import 'package:blinq/presentation/medical_assistance/medical_assistance_screen.dart';
import 'package:blinq/presentation/inform_close_ones/inform_close_ones_screen.dart';
import 'package:blinq/presentation/location_info/location_info_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class CreateReportBloc {
  //
  void onMedicalAssistancePressed() =>
      NavigationService.pushNamed(routeName: MedicalAssistanceScreen.route);

  void onEmergencyServicesPressed() =>
      NavigationService.pushNamed(routeName: EmergencyServicesScreen.route);

  void onInformYourCloseOnesPressed() =>
      NavigationService.pushNamed(routeName: InformCloseOnesScreen.route);

  void onCreateReportPressed() =>
      NavigationService.pushNamed(routeName: LocationInfoScreen.route);
}
