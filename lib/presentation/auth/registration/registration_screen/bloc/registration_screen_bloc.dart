import 'dart:async';
import 'dart:io';

import 'package:blinq/core/network/dio_client.dart';
import 'package:blinq/data/model/registration/registration_request_dto.dart';
import 'package:blinq/data/model/user/user_status.dart';
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/presentation/success_video/success_video_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/services/notification/notification_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'registration_screen_event.dart';
import 'registration_screen_state.dart';

class RegistrationScreenBloc
    extends Bloc<RegistrationScreenEvent, RegistrationScreenState> {
  final AuthRepository authRepository;

  final TextEditingController firstCodeController = TextEditingController();
  final TextEditingController secondCodeController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();

  RegistrationScreenBloc({required this.authRepository})
      : super(const RegistrationScreenState()) {
    on<OnFirstPasswordVisibilityChanged>(_onFirstPasswordVisibilityChanged);
    on<OnSecondPasswordVisibilityChanged>(_onSecondPasswordVisibilityChanged);
    on<OnSubmitted>(_onSubmitted);
  }

  FutureOr<void> _onFirstPasswordVisibilityChanged(
      OnFirstPasswordVisibilityChanged event,
      Emitter<RegistrationScreenState> emit) {
    emit(state.copyWith(firstCodeVisible: !state.firstCodeVisible));
  }

  FutureOr<void> _onSecondPasswordVisibilityChanged(
      OnSecondPasswordVisibilityChanged event,
      Emitter<RegistrationScreenState> emit) {
    emit(state.copyWith(secondCodeVisible: !state.secondCodeVisible));
  }

  FutureOr<void> _onSubmitted(
      OnSubmitted event, Emitter<RegistrationScreenState> emit) async {
    if (firstNameController.text.isEmpty) {
      NavigationService.showErrorToast('strEnterName'.tr());
      return;
    }
    if (secondNameController.text.isEmpty) {
      NavigationService.showErrorToast('strLastNameHint'.tr());
      return;
    }

    try {
      await NotificationService.setupNotificationService();
      final token = await NotificationService.getFcmToken();

      emit(state.copyWith(status: Status.loading));

      final res = await authRepository.register(
          registrationRequestDto: RegistrationRequestDto(
              email: event.email,
              password: firstCodeController.text,
              lastName: secondNameController.text,
              firstName: firstNameController.text,
              fcmToken: token ?? '',
              deviceType: Platform.isAndroid ? 'android' : 'ios'));
      authRepository.setToken(res.access!);
      authRepository.setRefreshToken(res.refresh!);
      authRepository.setUserStatus(UserStatus.signed);
      DioClient.setToken(res.access!);
      emit(state.copyWith(status: Status.initial));
      NavigationService.pushNamed(routeName: SuccessVideoScreen.route);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
