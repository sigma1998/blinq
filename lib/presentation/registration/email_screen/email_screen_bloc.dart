import 'dart:async';

import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/log_in/log_in_bottim_sheet.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_event.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_state.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailScreenBloc extends Bloc<EmailScreenEvent, EmailScreenState> {
  final AuthRepository authRepository;
  late final TextEditingController emailController;
  late final TextEditingController codeController;

  EmailScreenBloc({required this.authRepository})
      : super(const EmailScreenState()) {
    on<OnPrimaryButtonPressed>(_onPrimaryButtonPressed);
    on<OnSecondaryButtonPressed>(_onSecondaryButtonPressed);

    emailController = TextEditingController();
    codeController = TextEditingController();
  }

  FutureOr<void> _onPrimaryButtonPressed(
      OnPrimaryButtonPressed event, Emitter<EmailScreenState> emit) async {
    if (state.sendEmailResponse == null) {
      await _sendMailForCode(emit);
    } else {
      if (state.sendEmailResponse!.verificationCode == codeController.text) {
        NavigationService.pushReplacement(routeName: RegistrationScreen.route,
        arguments: state.sendEmailResponse!.email);
      }
    }
  }

  FutureOr<void> _onSecondaryButtonPressed(
      OnSecondaryButtonPressed event, Emitter<EmailScreenState> emit) async {
    if (state.sendEmailResponse == null) {
      NavigationService.showBottomSheet(sheet: const LogInBottomSheet());
    } else {
      await _sendMailForCode(emit);
    }
  }

  Future<void> _sendMailForCode(Emitter<EmailScreenState> emit) async {
    if (!EmailValidator.validate(emailController.text)) {
      return;
    }

    emit(state.copyWith(status: Status.loading));

    try {
      final res = await authRepository.sendEmail(emailController.text);
      emit(state.copyWith(status: Status.initial, sendEmailResponse: res));

      NavigationService.showToast(
          text: "strCodeSent".tr(), title: 'strCheckMain'.tr());
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
