import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(Status.initial) Status status,
  }) = _HomeScreenState;
}
