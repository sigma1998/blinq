// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';

part 'damaged_parts_state.freezed.dart';

@freezed
class DamagedPartsState with _$DamagedPartsState {
  const factory DamagedPartsState({
    @Default(Status.initial) Status status,
    @Default({}) Set<String> carParts,
    @Default({}) Set<String> bigCarParts,
    @Default({}) Set<String> motorcycleParts,
    @Default(0) int pageIndex
  }) = _DamagedPartsState;
}
