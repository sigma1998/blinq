import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class SplashScreenBloc {
  final AuthRepository authRepository;

  SplashScreenBloc({required this.authRepository});

  void checkStatus() async {
    final UserStatus status = authRepository.getUserStatus();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (status == UserStatus.signed) {
        NavigationService.newRootScreen(MainScreen.route);
      } else {
        NavigationService.pushNamed(routeName: SignInScreen.route);
      }
    });
  }
}
