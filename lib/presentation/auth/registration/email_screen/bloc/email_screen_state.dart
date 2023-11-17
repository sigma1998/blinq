import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_screen_state.freezed.dart';

@freezed
class EmailScreenState with _$EmailScreenState {
  const factory EmailScreenState({
    @Default(Status.initial) Status status,
    @Default(false)bool isCodeSent,
  }) = _EmailScreenState;
}
