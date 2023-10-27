import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class SplashScreenBloc {
  final AuthRepositoryImpl authRepository;

  SplashScreenBloc({required this.authRepository});

  void checkStatus() async {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      // NavigationService.newRootScreen(MainScreen.route);
      NavigationService.pushNamed(routeName: SignInScreen.route);
    });
  }
}
