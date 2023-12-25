// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:blinq/utils/generic_bloc_state.dart';
import 'report_type.dart';

part 'report_bloc_state.freezed.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState({
    @Default(Status.initial) Status status,
    @Default(User.A)User user,
  }) = _ReportState;
}
