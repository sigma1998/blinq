// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';

part 'edit_my_car_state.freezed.dart';

@freezed
class EditMyCarState with _$EditMyCarState {
  const factory EditMyCarState({
    @Default(Status.initial) Status status,
  }) = _EditMyCarState;
}
