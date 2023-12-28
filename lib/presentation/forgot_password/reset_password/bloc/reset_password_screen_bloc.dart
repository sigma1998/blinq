// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/validator.dart';
import 'reset_password_screen_state.dart';
import 'reset_password_state_event.dart';

class ResetPasswordScreenBloc
    extends Bloc<ResetPasswordScreenEvent, ResetPasswordScreenState> {
  final AuthRepository authRepository;

  final TextEditingController firstCodeController = TextEditingController();
  final TextEditingController secondCodeController = TextEditingController();

  ResetPasswordScreenBloc({required this.authRepository})
      : super(const ResetPasswordScreenState()) {
    on<OnFirstPasswordVisibilityChanged>(_onFirstPasswordVisibilityChanged);
    on<OnSecondPasswordVisibilityChanged>(_onSecondPasswordVisibilityChanged);
    on<OnSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onFirstPasswordVisibilityChanged(
      OnFirstPasswordVisibilityChanged event,
      Emitter<ResetPasswordScreenState> emit) {
    emit(state.copyWith(firstCodeVisible: !state.firstCodeVisible));
  }

  FutureOr<void> _onSecondPasswordVisibilityChanged(
      OnSecondPasswordVisibilityChanged event,
      Emitter<ResetPasswordScreenState> emit) {
    emit(state.copyWith(secondCodeVisible: !state.secondCodeVisible));
  }

  FutureOr<void> _onSubmitted(
      OnSubmitted event, Emitter<ResetPasswordScreenState> emit) async {
    emit(state.copyWith(status: Status.loading));
    if (Validator().validateStrongPassword(firstCodeController.text)) {
      return;
    }
    if (secondCodeController.text != firstCodeController.text) {
      return;
    }

    try {
      await authRepository.resetPassword(firstCodeController.text);

      emit(state.copyWith(status: Status.initial));

      NavigationService.showToast(
          text: 'strSuccess'.tr(),
          title: 'strPasswordChangedSuccessfully'.tr());

      await Future.delayed(const Duration(seconds: 1));

      NavigationService.newRootScreen(SignInScreen.route);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
