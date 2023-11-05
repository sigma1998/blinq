// Dart imports:
import 'dart:async';

// Package imports:
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'password_editor_event.dart';

part 'password_editor_state.dart';
part 'password_editor_bloc.freezed.dart';

class PasswordEditorBloc
    extends Bloc<PasswordEditorEvent, PasswordEditorState> {
  //
  final ProfileRepository repository;

  PasswordEditorBloc({required this.repository})
      : super(const PasswordEditorState()) {
    on<OnUpdatePassword>(_onUpdatePassword);
    //
    on<OnOldPasswordChanged>(_onOldPasswordChanged);
    on<OnNewPasswordChanged>(_onNewPasswordChanged);
    on<OnPasswordConfirmChanged>(_onPasswordConfirmChanged);
    //
    on<OnNewPasswordVisibilityChanged>(_onNewPasswordVisibilityChanged);
    on<OnPasswordConfirmVisibilityChanged>(_onPasswordConfirmVisibilityChanged);
  }

  FutureOr<void> _onUpdatePassword(
      OnUpdatePassword event, Emitter<PasswordEditorState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.updatePassword(state.oldPassword, state.newPassword);
      emit(state.copyWith(status: Status.success));
      NavigationService.back();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
      NavigationService.showErrorToast(e.toString());
    }
  }

  FutureOr<void> _onOldPasswordChanged(
      OnOldPasswordChanged event, Emitter<PasswordEditorState> emit) {
    emit(state.copyWith(oldPassword: event.oldPassword));
  }

  FutureOr<void> _onNewPasswordChanged(
      OnNewPasswordChanged event, Emitter<PasswordEditorState> emit) {
    emit(state.copyWith(newPassword: event.newPassword));
  }

  FutureOr<void> _onPasswordConfirmChanged(
      OnPasswordConfirmChanged event, Emitter<PasswordEditorState> emit) {
    emit(state.copyWith(passwordConfirm: event.passwordConfirm));
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
