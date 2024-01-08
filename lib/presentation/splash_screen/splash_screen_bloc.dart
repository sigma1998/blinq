// Dart imports:
import 'dart:io';

// Project imports:
import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/presentation/intro/first_intro_screen/first_intro_screen.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/notification/notification_service.dart';

class SplashScreenBloc {
  final AuthRepository authRepository;

  SplashScreenBloc({required this.authRepository});

  void checkStatus() async {
    final UserStatus status = authRepository.getUserStatus();

    Future.delayed(const Duration(seconds: 3)).then((_) async {
      switch (status) {
        case UserStatus.signed:
          await _onSignedUser();
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

  Future<void> _onSignedUser() async {
    final token =
        await authRepository.refreshToken(authRepository.getRefreshToken());
    DioClient.setToken(token.access);

    final String? myFCMToken = authRepository.getFirebaseToken();

    await NotificationService.setupNotificationService();
    final firebaseToken = await NotificationService.getFcmToken();

    int? id = authRepository.getUserId();
    if (myFCMToken != firebaseToken && myFCMToken != null && id != null) {
      authRepository.updateAuthToken(
        userId: id,
        token: myFCMToken,
        deviceType: Platform.isAndroid ? 'android' : 'ios',
      );
    }
    NavigationService.newRootScreen(MainScreen.route);
  }
}
