import 'package:blinq/presentation/log_in/log_in_bottim_sheet.dart';
import 'package:blinq/utils/navigation_service.dart';

class SignInScreenBloc {
  void onSignUpPressed() {
    //TODO navigate to sign up screen
  }

  void onLogInPressed() {
    NavigationService.showBottomSheet(sheet: const LogInBottomSheet());
  }
}
