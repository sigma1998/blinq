import 'package:blinq/presentation/report/bloc/report_type.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_state.freezed.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState({
    @Default(Status.initial) Status status,
    @Default(1) int progressIndex,
    @Default(ReportType.accident) ReportType reportType,
  }) = _ReportState;
}
