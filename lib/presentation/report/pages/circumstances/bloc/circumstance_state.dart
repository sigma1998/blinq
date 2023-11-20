import 'package:freezed_annotation/freezed_annotation.dart';

part  'circumstance_state.freezed.dart';

@freezed
class CircumstanceState with _$CircumstanceState {
  const factory CircumstanceState({
    @Default({}) Set<String> driverA,
    @Default({}) Set<String> driverB,
}) = _CircumstanceState;
}
