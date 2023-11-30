import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part  'injury_screen_state.freezed.dart';


@freezed
class InjuryScreenState with _$InjuryScreenState {
  const factory InjuryScreenState({
    @Default(Status.initial) Status status,
    Error? error,

  }) = _InjuryScreenState;
}
