// Package imports:
import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';

// Project imports:
import 'package:blinq/presentation/email_editor/email_editor_screen.dart';
import 'package:blinq/presentation/language/language_screen.dart';
import 'package:blinq/presentation/password_editor/password_editor_screen.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/permission/i_permission_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, GenericBlocState<bool>> {
  //
  final ProfileBloc profileBloc;
  final IPermissionService permissionService;
  final AuthRepository authRepository;

  SettingsBloc(
      {required this.profileBloc,
      required this.permissionService,
      required this.authRepository})
      : super(GenericBlocState.success(false)) {
    on<ToggleNotification>(_toggleNotification);
  }

  void onEmailPressed() =>
      NavigationService.pushNamed(routeName: EmailEditorScreen.route);

  void onPasswordPressed() =>
      NavigationService.pushNamed(routeName: PasswordEditorScreen.route);

  void onLanguagePressed() =>
      NavigationService.pushNamed(routeName: LanguageScreen.route);

  void _toggleNotification(
      ToggleNotification event, Emitter<GenericBlocState<bool>> emit) {
    permissionService.handleNotificationPermission();
    emit(GenericBlocState.success(event.isEnabled));
  }

  void onDeleteAccount() {
    // TODO: implement method
  }

  void onLogoutPressed() {
    DioClient.setToken(null);
    authRepository.setUserStatus(UserStatus.haveSeenIntro);
    NavigationService.pushReplacement(routeName: SignInScreen.route);
  }
}
