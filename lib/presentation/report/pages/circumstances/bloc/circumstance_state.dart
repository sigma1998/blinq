// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';

part  'circumstance_state.freezed.dart';

@freezed
class CircumstanceState with _$CircumstanceState {
  const factory CircumstanceState({
    @Default(Status.initial) Status status,
    @Default({}) Set<String> driverA,
    @Default({}) Set<String> driverB,
}) = _CircumstanceState;
}
