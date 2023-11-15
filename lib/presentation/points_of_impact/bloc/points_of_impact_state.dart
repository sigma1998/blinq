import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_of_impact_state.freezed.dart';

@freezed
class PointsOfImpactScreenState with _$PointsOfImpactScreenState {
  const factory PointsOfImpactScreenState({
    @Default(Status.initial) Status status,
    @Default(false) bool isTopLeftActive,
    @Default(false) bool isTopRightActive,
    @Default(false) bool isTopActive,
    @Default(false) bool isLeftActive,
    @Default(false) bool isRightActive,
    @Default(false) bool isBottomLeftActive,
    @Default(false) bool isBottomActive,
    @Default(false) bool isBottomRightActive,
  }) = _PointsOfImpactScreenState;
}
