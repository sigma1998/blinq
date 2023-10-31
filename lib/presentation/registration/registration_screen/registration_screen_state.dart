

import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_screen_state.freezed.dart';

@freezed
class RegistrationScreenState with _$RegistrationScreenState{
  const factory RegistrationScreenState ({
    @Default(Status.initial) Status status,
    Error? error,
    @Default(true) firstCodeVisible,
    @Default(true) secondCodeVisible,

  }) = _RegistrationScreenState;
}