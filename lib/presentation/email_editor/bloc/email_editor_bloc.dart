// Package imports:
import 'dart:async';

import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'email_editor_event.dart';

part 'email_editor_state.dart';
part 'email_editor_bloc.freezed.dart';

class EmailEditorBloc extends Bloc<EmailEditorEvent, EmailEditorState> {
  //
  final ProfileRepository repository;

  EmailEditorBloc({required this.repository})
      : super(const EmailEditorState()) {
    on<OnCurrentEmailChanged>(_onCurrentEmailChanged);
    on<OnNewEmailChanged>(_onNewEmailChanged);
    on<OnConfrimationCodeChanged>(_onConfrimationCodeChanged);
    on<OnSendCode>(_onSendCode);
    on<OnVerifyEmail>(_onVerifyEmail);
  }

  //

  FutureOr<void> _onCurrentEmailChanged(
      OnCurrentEmailChanged event, Emitter<EmailEditorState> emit) {
    emit(state.copyWith(oldEmail: event.currentEmail));
  }

  FutureOr<void> _onNewEmailChanged(
      OnNewEmailChanged event, Emitter<EmailEditorState> emit) {
    emit(state.copyWith(newEmail: event.newEmail));
  }

  FutureOr<void> _onConfrimationCodeChanged(
      OnConfrimationCodeChanged event, Emitter<EmailEditorState> emit) {
    emit(state.copyWith(verificationCode: event.code));
  }

  //

  FutureOr<void> _onSendCode(
      OnSendCode event, Emitter<EmailEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.updateEmail(state.newEmail);
      emit(state.copyWith(status: Status.success, isCodeSent: true));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
      NavigationService.showErrorToast(e.toString());
    }
  }

  FutureOr<void> _onVerifyEmail(
      OnVerifyEmail event, Emitter<EmailEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.verifyEmail(state.verificationCode);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
      NavigationService.showErrorToast(e.toString());
    }
  }
}
