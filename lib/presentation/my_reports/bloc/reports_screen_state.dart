import 'package:blinq/data/model/history/history_item/history_item_dto.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reports_screen_state.freezed.dart';

@freezed
class ReportsScreenState with _$ReportsScreenState {
  const factory ReportsScreenState({
    @Default(Status.initial) Status status,
    @Default(0) int pageIndex,
    @Default([]) List<HistoryItemModelDto> accidents,
    @Default([]) List<HistoryItemModelDto> breakdowns,
    @Default(false) bool isDownloading,
  }) = _ReportsScreenState;
}
