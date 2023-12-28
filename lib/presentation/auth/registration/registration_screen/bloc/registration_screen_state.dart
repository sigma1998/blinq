// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';

part 'registration_screen_state.freezed.dart';

@freezed
class RegistrationScreenState with _$RegistrationScreenState {
  const factory RegistrationScreenState({
    @Default(Status.initial) Status status,
    @Default(true) firstCodeVisible,
    @Default(true) secondCodeVisible,
  }) = _RegistrationScreenState;
}
