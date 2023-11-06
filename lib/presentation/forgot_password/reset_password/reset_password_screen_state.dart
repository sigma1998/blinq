import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_screen_state.freezed.dart';

@freezed
class ResetPasswordScreenState with _$ResetPasswordScreenState {
  const factory ResetPasswordScreenState({
    @Default(Status.initial) Status status,
    @Default(true) firstCodeVisible,
    @Default(true) secondCodeVisible,
  }) = _ResetPasswordScreenState;
}
