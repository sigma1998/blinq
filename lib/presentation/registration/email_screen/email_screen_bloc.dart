import 'dart:async';

import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_event.dart';
import 'package:blinq/presentation/registration/email_screen/email_screen_state.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailScreenBloc extends Bloc<EmailScreenEvent, EmailScreenState> {
  final AuthRepository authRepository;
  late final TextEditingController emailController;
  late final TextEditingController codeController;

  EmailScreenBloc({required this.authRepository})
      : super(const EmailScreenState()) {
    on<OnCodeSubmitted>(_onCodeSubmitted);
    on<OnEmailSubmitted>(_onEmailSubmitted);
    on<OnEmailEdited>(_onEmailEdited);
    on<OnCodeEdited>(_onCodeEdited);

    emailController = TextEditingController();
    codeController = TextEditingController();

    emailController.addListener(() {
      add(OnEmailEdited());
    });

    codeController.addListener(() {
      add(OnCodeEdited());
    });
  }

  FutureOr<void> _onCodeSubmitted(
      OnCodeSubmitted event, Emitter<EmailScreenState> emit) {}

  FutureOr<void> _onEmailSubmitted(
      OnEmailSubmitted event, Emitter<EmailScreenState> emit) async{
    emit(state.copyWith(status: Status.loading));

    //TODO implement api here
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      emit(state.copyWith(status: Status.initial));
    });

    NavigationService.pushNamed(routeName: RegistrationScreen.route);

  }

  FutureOr<void> _onEmailEdited(
      OnEmailEdited event, Emitter<EmailScreenState> emit) {
    if (state.error?.data.containsKey('mail_error')??false) {
      state.error?.data.remove('mail_error');
    }
  }

  FutureOr<void> _onCodeEdited(
      OnCodeEdited event, Emitter<EmailScreenState> emit) {
    if (state.error?.data.containsKey('code_error')??false) {
      state.error?.data.remove('code_error');
    }
  }
}
