// Project imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/presentation/create_report/create_report_screen.dart';
import 'package:blinq/utils/navigation_service.dart';

import '../../../../presentation/break_down/break_down_type/presentation/break_down_type_screen.dart';

class BlinqActivatedBloc {
  //
  final ReportBloc reportBloc;

  BlinqActivatedBloc({required this.reportBloc});

  //
  void onAccidentPressed() {
    NavigationService.back();

    reportBloc.setReportType(ReportType.accident);
  }

  void onBreakDownPressed() {
    NavigationService.back();

    reportBloc.setReportType(ReportType.breakdown);
    NavigationService.pushNamed(
      routeName: BreakDownTypeScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }
}
