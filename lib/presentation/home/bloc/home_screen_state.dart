// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(Status.initial) Status status,
    @Default(false) bool mapHidden,
    @Default(false) bool mapRendered,
  }) = _HomeScreenState;
}
