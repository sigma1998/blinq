import 'package:blinq/presentation/log_in/log_in_bottom_sheet.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class SignInScreenBloc {
  void onSignUpPressed() {
    NavigationService.pushNamed(routeName: EmailScreen.route);
  }

  void onLogInPressed() {
    NavigationService.showBottomSheet(sheet: const LogInBottomSheet());
  }
}
