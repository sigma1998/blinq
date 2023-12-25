// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'password_editor_event.dart';

part 'password_editor_state.dart';
part 'password_editor_bloc.freezed.dart';

class PasswordEditorBloc
    extends Bloc<PasswordEditorEvent, PasswordEditorState> {
  //
  final ProfileRepository repository;

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  PasswordEditorBloc({required this.repository})
      : super(const PasswordEditorState()) {
    on<OnUpdatePassword>(_onUpdatePassword);
    //
    on<OnNewPasswordVisibilityChanged>(_onNewPasswordVisibilityChanged);
    on<OnPasswordConfirmVisibilityChanged>(_onPasswordConfirmVisibilityChanged);
  }

  FutureOr<void> _onUpdatePassword(
      OnUpdatePassword event, Emitter<PasswordEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.updatePassword(
        oldPasswordController.text,
        newPasswordController.text,
      );
      emit(state.copyWith(status: Status.success));
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  ///
  /// Visibility
  ///

  FutureOr<void> _onNewPasswordVisibilityChanged(
      OnNewPasswordVisibilityChanged event, Emitter<PasswordEditorState> emit) {
    emit(state.copyWith(isCodeVisible: !state.isCodeVisible));
  }

  FutureOr<void> _onPasswordConfirmVisibilityChanged(
      OnPasswordConfirmVisibilityChanged event,
      Emitter<PasswordEditorState> emit) {
    emit(state.copyWith(isConfirmCodeVisible: !state.isConfirmCodeVisible));
  }
}
