// Flutter imports:
import 'package:blinq/utils/navigation_service.dart';

import 'screens/faq/faq_screen.dart';
import 'screens/mast_head_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/technical_data_screen.dart';

class HomeInfoBloc {
  //
  void onTechnicalDataPressed() {
    NavigationService.pushNamed(
      routeName: HomeInfoTechnicalDataScreen.route,
      nestedKey: NavigationService.homeInfoNavigatorKey,
    );
  }

  void onRegistrationPressed() {
    NavigationService.pushNamed(
      routeName: HomeInfoRegistrationScreen.route,
      nestedKey: NavigationService.homeInfoNavigatorKey,
    );
  }

  void onMastHeadPressed() {
    NavigationService.pushNamed(
      routeName: HomeInfoMastHeadScreen.route,
      nestedKey: NavigationService.homeInfoNavigatorKey,
    );
  }

  void onFaqPressed() {
    NavigationService.pushNamed(
      routeName: HomeInfoFaqScreen.route,
      nestedKey: NavigationService.homeInfoNavigatorKey,
    );
  }

  void onNavigateBack() {
    NavigationService.homeInfoNavigatorKey.currentState?.pop();
  }
}
