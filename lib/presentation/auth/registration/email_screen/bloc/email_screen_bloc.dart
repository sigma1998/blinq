import 'dart:async';

import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/send_email/response/send_email_response.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/log_in/log_in_bottom_sheet.dart';
import 'package:blinq/presentation/auth/registration/registration_screen/registration_screen.dart';
import 'package:blinq/presentation/forgot_password/reset_password/reset_password_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_screen_event.dart';
import 'email_screen_state.dart';

class EmailScreenBloc extends Bloc<EmailScreenEvent, EmailScreenState> {
  final AuthRepository authRepository;
  final bool isVerifying;

  late final TextEditingController emailController;
  late final TextEditingController codeController;
  SendEmailResponse? sendEmailForRegistrationResponse;

  EmailScreenBloc({required this.authRepository, required this.isVerifying})
      : super(const EmailScreenState()) {
    on<OnPrimaryButtonPressed>(_onPrimaryButtonPressed);
    on<OnSecondaryButtonPressed>(_onSecondaryButtonPressed);

    emailController = TextEditingController();
    codeController = TextEditingController();
  }

  FutureOr<void> _onPrimaryButtonPressed(
      OnPrimaryButtonPressed event, Emitter<EmailScreenState> emit) async {
    if (!state.isCodeSent) {
      if (isVerifying) {
        await _sendVerificationMailForCode(emit);
      } else {
        await _sendRegistrationMailForCode(emit);
      }
    } else {
      if (isVerifying) {
        await _sendVerificationCode(emit);
      } else {
        if (sendEmailForRegistrationResponse!.verificationCode ==
            codeController.text) {
          NavigationService.pushReplacement(
              routeName: RegistrationScreen.route,
              arguments: sendEmailForRegistrationResponse!.email);
        }
        else{
          NavigationService.showErrorToast('strInvalidCode'.tr());
        }
      }
    }
  }

  FutureOr<void> _onSecondaryButtonPressed(
      OnSecondaryButtonPressed event, Emitter<EmailScreenState> emit) async {
    if (!state.isCodeSent) {
      NavigationService.showBottomSheet(sheet: const LogInBottomSheet());
    } else {
      if (isVerifying) {
        await _sendVerificationMailForCode(emit);
      } else {
        await _sendRegistrationMailForCode(emit);
      }
    }
  }

  Future<void> _sendRegistrationMailForCode(
      Emitter<EmailScreenState> emit) async {
    if (!EmailValidator.validate(emailController.text)) {
      return;
    }

    emit(state.copyWith(status: Status.loading));

    try {
      final res = await authRepository.sendEmail(emailController.text);
      sendEmailForRegistrationResponse = res;
      emit(state.copyWith(status: Status.initial, isCodeSent: true));

      NavigationService.showToast(
          text: "strCodeSent".tr(), title: 'strCheckMain'.tr());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> _sendVerificationMailForCode(
      Emitter<EmailScreenState> emit) async {
    if (!EmailValidator.validate(emailController.text)) {
      return;
    }

    emit(state.copyWith(status: Status.loading));

    try {
      await authRepository.getVerificationCode(emailController.text);

      emit(state.copyWith(status: Status.initial, isCodeSent: true));

      NavigationService.showToast(
          text: "strCodeSent".tr(), title: 'strCheckMain'.tr());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  Future<void> _sendVerificationCode(Emitter<EmailScreenState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final res = await authRepository.confirmMailVerification(
          mail: emailController.text, code: codeController.text);
      DioClient.setToken(res);

      emit(state.copyWith(status: Status.initial));

      NavigationService.pushNamed(routeName: ResetPasswordScreen.route);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
