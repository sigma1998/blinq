// Project imports:
import 'package:blinq/data/model/history/history_item/history_item_dto.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';

sealed class ReportsScreenEvent{}

class OnInit extends ReportsScreenEvent{}

class OnTabBarChanged extends ReportsScreenEvent{
  final int index;
  OnTabBarChanged({required this.index});
}

class OnItemDelete extends ReportsScreenEvent{
  final int id;
  OnItemDelete({required this.id});
}

class OnOpenItem extends ReportsScreenEvent{
  final HistoryItemModelDto itemModelDto;
  OnOpenItem({required this.itemModelDto});
}

class OnDownloadItem extends ReportsScreenEvent{
  final HistoryItemModelDto itemModelDto;
  OnDownloadItem({required this.itemModelDto});
}
class OnContinueItem extends ReportsScreenEvent{
  final HistoryItemModelDto itemModelDto;
  final ReportType reportType;
  OnContinueItem({required this.itemModelDto, required this.reportType});
}




