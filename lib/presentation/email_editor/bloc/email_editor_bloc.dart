// Dart imports:
import 'dart:async';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/presentation/profile/bloc/profile_event.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

import 'email_editor_event.dart';

part 'email_editor_bloc.freezed.dart';

part 'email_editor_state.dart';

class EmailEditorBloc extends Bloc<EmailEditorEvent, EmailEditorState> {
  //
  final ProfileBloc profileBloc;
  final ProfileRepository repository;

  final newEmailController = TextEditingController();
  final codeController = TextEditingController();

  EmailEditorBloc({
    required this.profileBloc,
    required this.repository,
  }) : super(const EmailEditorState()) {
    on<OnSendCode>(_onSendCode);
    on<OnVerifyEmail>(_onVerifyEmail);
  }

  //

  FutureOr<void> _onSendCode(
      OnSendCode event, Emitter<EmailEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.updateEmail(newEmailController.text);
      emit(state.copyWith(status: Status.success, isCodeSent: true));
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onVerifyEmail(
      OnVerifyEmail event, Emitter<EmailEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.verifyEmail(codeController.text);
      emit(state.copyWith(status: Status.success));
      profileBloc.add(OnFetchProfile());
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
