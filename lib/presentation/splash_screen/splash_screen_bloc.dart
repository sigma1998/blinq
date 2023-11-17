import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/presentation/intro/first_intro_screen/first_intro_screen.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

class SplashScreenBloc {
  final AuthRepository authRepository;

  SplashScreenBloc({required this.authRepository});

  void checkStatus() async {
    final UserStatus status = authRepository.getUserStatus();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      switch (status) {
        case UserStatus.signed:

          DioClient.setToken(authRepository.getToken());

          NavigationService.newRootScreen(MainScreen.route);
          break;

        case UserStatus.haveSeenIntro:
          NavigationService.pushReplacement(routeName: SignInScreen.route);
          break;

        case UserStatus.newUser:
          authRepository.setUserStatus(UserStatus.haveSeenIntro);
          NavigationService.pushReplacement(routeName: FirstIntroScreen.route);
          break;
      }
    });
  }
}
