// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Project imports:
import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/auth/sign_in_screen/sign_in_screen.dart';
import 'package:blinq/presentation/delete_account_sheet/delete_account_confirm_sheet.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'delete_account_event.dart';

part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  //
  final AuthRepository repository;

  final codeController = TextEditingController();

  DeleteAccountBloc({required this.repository})
      : super(const DeleteAccountState()) {
    on<OnSendCodeDeleteAccount>(_onSendCodeDeleteAccount);
    on<OnVerifyDeleteAccount>(_onVerifyDeleteAccount);
  }

  FutureOr<void> _onSendCodeDeleteAccount(
      OnSendCodeDeleteAccount event, Emitter<DeleteAccountState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.deleteUser();
      emit(state.copyWith(status: Status.success));
      NavigationService.back();
      NavigationService.showBottomSheet(
        sheet: const DeleteAccountConfirmSheet(),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  FutureOr<void> _onVerifyDeleteAccount(
      OnVerifyDeleteAccount event, Emitter<DeleteAccountState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.verifyDeleteUser(codeController.text);
      emit(state.copyWith(status: Status.success));  
      DioClient.setToken(null);
      NavigationService.pushReplacement(routeName: SignInScreen.route);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
