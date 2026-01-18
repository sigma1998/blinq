// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// Project imports:
import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/login/google_request/login_google_request.dart';
import 'package:blinq/data/model/login/response/login_response_model.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/registration/email_screen/email_screen.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/presentation/success_video/success_video_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/notification/notification_service.dart';
import 'login_bottom_sheet_event.dart';
import 'login_bottom_sheet_state.dart';

class LoginBottomSheetBloc
    extends Bloc<LoginBottomSheetEvent, LoginBottomSheetState> {
  final AuthRepository authRepository;

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBottomSheetBloc({required this.authRepository})
      : super(const LoginBottomSheetState()) {
    on<OnSubmitted>(_onSubmitted);
    on<OnPasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<OnAppleSelected>(_onAppleSelected);
    on<OnGoogleSelected>(_onGoogleSelected);
    on<OnForgotPasswordPressed>(_onForgotPasswordPressed);
  }

  FutureOr<void> _onSubmitted(
      OnSubmitted event, Emitter<LoginBottomSheetState> emit) async {
    try {
      if (!EmailValidator.validate(mailController.text)) {
        return;
      }
      await NotificationService.setupNotificationService();
      final token = await NotificationService.getFcmToken();

      emit(state.copyWith(status: Status.loading));
      final res = await authRepository.login(
          mail: mailController.text,
          password: passwordController.text,
          fcmToken: token ?? '',
          deviceType: Platform.isAndroid ? 'android' : 'ios');
      _saveData(res, token ?? '');
      emit(state.copyWith(status: Status.initial));
      // NavigationService.newRootScreen(MainScreen.route);
      NavigationService.pushNamed(routeName: SuccessVideoScreen.route);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onPasswordVisibilityChanged(
      OnPasswordVisibilityChanged event, Emitter<LoginBottomSheetState> emit) {
    emit(state.copyWith(isCodeVisible: !state.isCodeVisible));
  }

  FutureOr<void> _onAppleSelected(
      OnAppleSelected event, Emitter<LoginBottomSheetState> emit) async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    if (credential.identityToken != null) {
      await NotificationService.setupNotificationService();
      final token = await NotificationService.getFcmToken();

      emit(state.copyWith(status: Status.loading));
      final res = await authRepository.loginWithApple(
        token: credential.identityToken!,
        fcmToken: token ?? '',
        deviceType: Platform.isAndroid ? 'android' : 'ios',
      );
      _saveData(res, token ?? '');
      emit(state.copyWith(status: Status.initial));
      NavigationService.newRootScreen(MainScreen.route);
    }
  }

  /// [_disconnectGoogle]
  /// Sign out is called to ensure the user is signed out from the app
  /// [GoogleSignIn().disconnect] allows to open the Google Sign In dialog again
  /// insead of silently signing in with the last account.
  FutureOr<void> _onGoogleSelected(
      OnGoogleSelected event, Emitter<LoginBottomSheetState> emit) async {
    print('CAME HERE____________________');
    try {
      GoogleSignIn.instance.initialize();
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn.instance.authenticate();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        await NotificationService.setupNotificationService();
        final token = await NotificationService.getFcmToken();
        print('TOKEN___________________$token');

        emit(state.copyWith(status: Status.loading));
        final model = LoginGoogleRequest(
          email: googleUser?.email ?? '',
          displayName: googleUser?.displayName ?? '',
          id: googleUser?.id ?? '',
          fcmToken: token ?? '',
          deviceType: Platform.isAndroid ? 'android' : 'ios',
        );
        final res = await authRepository.loginWithGoogle(model);
        _saveData(res, token ?? '');
        emit(state.copyWith(status: Status.initial));
        NavigationService.newRootScreen(MainScreen.route);
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: Status.initial));
    }
  }

  void _saveData(LoginResponseModel res, String firebaseToken) {
    DioClient.setToken(res.access);
    authRepository.setToken(res.access!);
    authRepository.setRefreshToken(res.refresh!);
    authRepository.setUserStatus(UserStatus.signed);
    authRepository.setFirebaseToken(firebaseToken);
  }

  FutureOr<void> _onForgotPasswordPressed(
      OnForgotPasswordPressed event, Emitter<LoginBottomSheetState> emit) {
    NavigationService.pushNamed(
        routeName: EmailScreen.route,
        arguments: EmailScreenArgs(isVerifying: true));
  }
}
