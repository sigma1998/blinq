import 'dart:async';

import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/log_in/login_bottom_sheet_event.dart';
import 'package:blinq/presentation/log_in/login_bottom_sheet_state.dart';
import 'package:blinq/presentation/main_screen/main_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBottomSheetBloc
    extends Bloc<LoginBottomSheetEvent, LoginBottomSheetState> {
  final AuthRepository authRepository;

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBottomSheetBloc({required this.authRepository})
      : super(const LoginBottomSheetState()) {
    on<OnSubmitted>(_onSubmitted);
    on<OnPasswordVisibilityChanged>(_onPasswordVisibilityChanged);
    on<OnMailEdited>(_onMailEdited);

    mailController.addListener(() {
      add(OnMailEdited());
    });
  }

  FutureOr<void> _onSubmitted(
      OnSubmitted event, Emitter<LoginBottomSheetState> emit) async {
    try {
      if(!state.isMailValid){
        return;
      }
      emit(state.copyWith(status: Status.loading));
      final res = await authRepository.login(
          mail: mailController.text, password: passwordController.text);
      DioClient.setToken(res.access);
      authRepository.setToken(res.access!);
      authRepository.setRefreshToken(res.refresh!);
      authRepository.setUserStatus(UserStatus.signed);
      emit(state.copyWith(status: Status.initial));
      NavigationService.newRootScreen(MainScreen.route);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onPasswordVisibilityChanged(
      OnPasswordVisibilityChanged event, Emitter<LoginBottomSheetState> emit) {
    emit(state.copyWith(isCodeVisible: !state.isCodeVisible));
  }

  FutureOr<void> _onMailEdited(
      OnMailEdited event, Emitter<LoginBottomSheetState> emit) {
    emit(state.copyWith(
        isMailValid: EmailValidator.validate(mailController.text)));
  }
}
