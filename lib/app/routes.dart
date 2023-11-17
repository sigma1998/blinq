// Flutter imports:
import 'package:blinq/presentation/circumstances/circumstances_screen.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/presentation/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/presentation/email_editor/email_editor_screen.dart';
import 'package:blinq/presentation/emergency_services/emergency_services_screen.dart';
import 'package:blinq/presentation/forgot_password/reset_password/reset_password_screen.dart';
import 'package:blinq/presentation/home/home_screen.dart';
import 'package:blinq/presentation/inform_close_ones/inform_close_ones_screen.dart';

// Project imports:
import 'package:blinq/presentation/injury/injury_screen.dart';
import 'package:blinq/presentation/intro/first_intro_screen/first_intro_screen.dart';
import 'package:blinq/presentation/intro/second_intro_screen/second_intro_screen.dart';
import 'package:blinq/presentation/language/language_screen.dart';
import 'package:blinq/presentation/location_info/location_info_screen.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/map/map_screen.dart';
import 'package:blinq/presentation/medical_assistance/medical_assistance_screen.dart';
import 'package:blinq/presentation/password_editor/password_editor_screen.dart';
import 'package:blinq/presentation/points_of_impact/points_of_impact_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/driver/driver_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/insurance/insurance_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_car/my_car_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/my_vehicle/my_vehicle_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/policy_holder/policy_holder_editor_screen.dart';
import 'package:blinq/presentation/profile/widgets/editors/vehicle/vehicle_editor_screen.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen.dart';
import 'package:blinq/presentation/reports/pdf_view/pdf_view.dart';
import 'package:blinq/presentation/reports/reports_screen.dart';
import 'package:blinq/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/presentation/sketch/sketch_screen.dart';
import 'package:blinq/presentation/speech_to_text/speech_to_text_screen.dart';
import 'package:blinq/presentation/splash_screen/splash_screen.dart';
import 'package:blinq/presentation/success_video/success_video_screen.dart';
import 'package:blinq/presentation/test/test_screen2.dart';
import 'package:flutter/material.dart';

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
    CreateReportScreen.route: (context) => const CreateReportScreen(),
    MedicalAssistanceScreen.route: (context) => const MedicalAssistanceScreen(),
    EmergencyServicesScreen.route: (context) => const EmergencyServicesScreen(),
    InformCloseOnesScreen.route: (context) => const InformCloseOnesScreen(),

    //^ Report
    LocationInfoScreen.route: (context) => const LocationInfoScreen(),
    InjuryScreen.route: (context) => const InjuryScreen(),
    SpeechToTextScreen.route: (context) => const SpeechToTextScreen(),

    SketchScreen.route: (context) => const SketchScreen(),
  };
}

Route onGenerateHomeRoutes(RouteSettings settings) {
  late Widget page;
  switch (settings.name) {
    case HomeScreen.route:
      page = const HomeScreen();
    case CreateReportScreen.route:
      page = const CreateReportScreen();
    case TestScreen2.route:
      page = const TestScreen2();
    case MapScreen.route:
      page = const MapScreen();
    case PointsOfImpactScreen.route:
      page = PointsOfImpactScreen();
    case CircumstancesScreen.route:
      page = CircumstancesScreen();
    case SketchScreen.route:
      page = const SketchScreen();
    case DamagedPartsScreen.route:
      page = const DamagedPartsScreen();
    default:
      page = const HomeScreen();
  }

  return MaterialPageRoute<dynamic>(
    builder: (context) {
      return page;
    },
    settings: settings,
  );
}
