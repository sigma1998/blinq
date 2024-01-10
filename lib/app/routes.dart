// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/presentation/auth/registration/email_screen/email_screen.dart';
import 'package:blinq/presentation/auth/registration/registration_screen/registration_screen.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/presentation/connect_to_blinq/connect_to_blinq_screen.dart';
import 'package:blinq/presentation/contacts/editors/contact/contact_edit_screen.dart';
import 'package:blinq/presentation/contacts/editors/premage_message/premade_message_edit_screen.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/presentation/email_editor/email_editor_screen.dart';
import 'package:blinq/presentation/emergency_services/emergency_services_screen.dart';
import 'package:blinq/presentation/forgot_password/reset_password/reset_password_screen.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:blinq/presentation/home/pages/info/info_screen.dart';
import 'package:blinq/presentation/home/pages/info/screens/faq/faq_screen.dart';
import 'package:blinq/presentation/home/pages/info/screens/mast_head_screen.dart';
import 'package:blinq/presentation/home/pages/info/screens/registration_screen.dart';
import 'package:blinq/presentation/home/pages/info/screens/technical_data_screen.dart';
import 'package:blinq/presentation/inform_close_ones/inform_close_ones_screen.dart';
import 'package:blinq/presentation/intro/first_intro_screen/first_intro_screen.dart';
import 'package:blinq/presentation/intro/second_intro_screen/second_intro_screen.dart';
import 'package:blinq/presentation/language/language_screen.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/map/map_screen.dart';
import 'package:blinq/presentation/medical_assistance/medical_assistance_screen.dart';
import 'package:blinq/presentation/my_reports/pdf_view/pdf_view.dart';
import 'package:blinq/presentation/my_reports/reports_screen.dart';
import 'package:blinq/presentation/offline/offline_screen.dart';
import 'package:blinq/presentation/password_editor/password_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/driver/driver_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/insurance/insurance_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/my_car_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_vehicle/my_vehicle_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/policy_holder/policy_holder_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/vehicle/vehicle_editor_screen.dart';
import 'package:blinq/presentation/report/pages/a_b_users_completed/a_b_users_completed_screen.dart';
import 'package:blinq/presentation/report/pages/circumstances/circumstances_screen.dart';
import 'package:blinq/presentation/report/pages/connect_to_driver/connect_to_driver_screen.dart';
import 'package:blinq/presentation/report/pages/damaged_media/damaged_media_screen.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/presentation/report/pages/finished/finished_screen.dart';
import 'package:blinq/presentation/report/pages/injury/injury_screen.dart';
import 'package:blinq/presentation/report/pages/location_info/location_info_screen.dart';
import 'package:blinq/presentation/report/pages/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/report/pages/qr_scan/qr_scan_screen.dart';
import 'package:blinq/presentation/report/pages/second_driver/second_driver_screen.dart';
import 'package:blinq/presentation/report/pages/sign/sign_screen.dart';
import 'package:blinq/presentation/report/pages/sketch/sketch_screen.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/presentation/report/pages/vehicle_type/vehicle_type_screen.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/car/car_screen.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/driver/driver_screen.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/insurance_company/insurance_company_screen.dart';
import 'package:blinq/presentation/report/second_driver_editors/screens/policy_holder/policy_holder_screen.dart';
import 'package:blinq/presentation/splash_screen/splash_screen.dart';
import 'package:blinq/presentation/success_video/success_video_screen.dart';

Map<String, WidgetBuilder> getRoutes(BuildContext context) {
  return {
    SplashScreen.route: (context) => const SplashScreen(),
    MainScreen.route: (context) => const MainScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    EmailScreen.route: (context) => const EmailScreen(),
    RegistrationScreen.route: (context) => const RegistrationScreen(),

    //^ Settings
    EmailEditorScreen.route: (context) => const EmailEditorScreen(),
    LanguageScreen.route: (context) => const LanguageScreen(),
    PasswordEditorScreen.route: (context) => const PasswordEditorScreen(),

    //* Reports
    ReportsScreen.route: (context) => const ReportsScreen(),
    PdfViewScreen.route: (context) => const PdfViewScreen(),

    //! Profile Editors
    DriverEditorScreen.route: (context) => const DriverEditorScreen(),
    PolicyHolderEditorScreen.route: (context) =>
        const PolicyHolderEditorScreen(),
    VehicleEditorScreen.route: (context) => const VehicleEditorScreen(),
    InsuranceEditorScreen.route: (context) => const InsuranceEditorScreen(),
    EditorMyCarScreen.route: (context) => const EditorMyCarScreen(),

    MyVehicleEditorScreen.route: (context) => const MyVehicleEditorScreen(),
    FirstIntroScreen.route: (context) => const FirstIntroScreen(),
    SecondIntroScreen.route: (context) => const SecondIntroScreen(),
    SuccessVideoScreen.route: (context) => const SuccessVideoScreen(),
    ResetPasswordScreen.route: (context) => const ResetPasswordScreen(),

    //& Home
    MedicalAssistanceScreen.route: (context) => const MedicalAssistanceScreen(),
    EmergencyServicesScreen.route: (context) => const EmergencyServicesScreen(),
    InformCloseOnesScreen.route: (context) => const InformCloseOnesScreen(),

    //^ Contact
    OfflineScreen.route: (context) => const OfflineScreen(),
  };
}

Route onGenerateHomeRoutes(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case HomeScreen.route:
      page = const HomeScreen();
    case CreateReportScreen.route:
      page = const CreateReportScreen();
    case ConnectToBlinqScreen.route:
      page = const ConnectToBlinqScreen();
    case MapScreen.route:
      page = const MapScreen();
    case PointsOfImpactScreen.route:
      page = const PointsOfImpactScreen();
    case CircumstancesScreen.route:
      page = const CircumstancesScreen();
    case SketchScreen.route:
      page = const SketchScreen();
    case DamagedPartsScreen.route:
      page = const DamagedPartsScreen();
    case DamagedMediaScreen.route:
      page = const DamagedMediaScreen();
    case SignScreen.route:
      page = const SignScreen();
    case VehicleTypeScreen.route:
      page = const VehicleTypeScreen();
    case LocationInfoScreen.route:
      page = const LocationInfoScreen();
    case InjuryScreen.route:
      page = const InjuryScreen();
    case ConnectToDriverScreen.route:
      page = const ConnectToDriverScreen();
    case QrScanScreen.route:
      page = const QrScanScreen();
    case SpeechToTextScreen.route:
      page = const SpeechToTextScreen();
    case SecondDriverScreen.route:
      page = const SecondDriverScreen();
    case ABUsersCompletedScreen.route:
      page = const ABUsersCompletedScreen();
    case FinishedScreen.route:
      page = const FinishedScreen();

    //~ Second Driver Editors
    case SecondDriverEditorScreen.route:
      page = const SecondDriverEditorScreen();
    case SecondDriverEditorCarScreen.route:
      page = const SecondDriverEditorCarScreen();
    case SecondDriverEditorPolicyHolderScreen.route:
      page = const SecondDriverEditorPolicyHolderScreen();
    case SecondDriverEditorInsuranceScreen.route:
      page = const SecondDriverEditorInsuranceScreen();
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

Route onGenerateContactRoutes(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case ContactEditScreen.route:
      page = const ContactEditScreen();
    case PremadeMessageEditScreen.route:
      page = const PremadeMessageEditScreen();
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}

Route onGenerateInfoRoutes(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case HomeInfoTechnicalDataScreen.route:
      page = const HomeInfoTechnicalDataScreen();
    case HomeInfoRegistrationScreen.route:
      page = const HomeInfoRegistrationScreen();
    case HomeInfoMastHeadScreen.route:
      page = const HomeInfoMastHeadScreen();
    case HomeInfoFaqScreen.route:
      page = const HomeInfoFaqScreen();
    default:
      page = const HomeInfoScreen();
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
