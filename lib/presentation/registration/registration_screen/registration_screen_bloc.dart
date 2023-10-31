import 'dart:async';

import 'package:blinq/presentation/registration/registration_screen/registration_screen_event.dart';
import 'package:blinq/presentation/registration/registration_screen/registration_screen_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreenBloc
    extends Bloc<RegistrationScreenEvent, RegistrationScreenState> {

  final TextEditingController firstCodeController = TextEditingController();
  final TextEditingController secondCodeController = TextEditingController();

  RegistrationScreenBloc() : super(const RegistrationScreenState()) {
    on<OnFirstPasswordChanged>(_onFirstPasswordChanged);
    on<OnSecondPasswordChanged>(_onSecondPasswordChanged);
    on<OnSubmitted>(_onSubmitted);

    firstCodeController.addListener(() {
      add(OnFirstPasswordChanged());
    });
    secondCodeController.addListener(() {
      add(OnSecondPasswordChanged());
    });
  }

  FutureOr<void> _onFirstPasswordChanged(
      OnFirstPasswordChanged event, Emitter<RegistrationScreenState> emit) {}

  FutureOr<void> _onSecondPasswordChanged(
      OnSecondPasswordChanged event, Emitter<RegistrationScreenState> emit) {}

  FutureOr<void> _onSubmitted(
      OnSubmitted event, Emitter<RegistrationScreenState> emit) {}
}
