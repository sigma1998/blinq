// Flutter imports:
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/my_reports/widgets/states/empty_state.dart';
import 'package:blinq/presentation/my_reports/bloc/reports_screen_event.dart';
import 'package:blinq/presentation/my_reports/bloc/reports_screen_state.dart';
import 'package:blinq/presentation/my_reports/widgets/items/report_item.dart';
import 'package:blinq/presentation/my_reports/bloc/reports_screen_bloc.dart';

class AccidentReportsView extends StatelessWidget {
  //
  const AccidentReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReportsScreenBloc>();

    return BlocBuilder<ReportsScreenBloc, ReportsScreenState>(
      builder: (context, state) {
        if (state.accidents.isEmpty) return const ReportsEmptyStateWidget();

        return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 21),
            itemBuilder: (context, index) {
              return ProfileReportItem(
                historyItemModelDto: state.accidents[index],
                onDelete: () => bloc.add(
                  OnItemDelete(id: state.accidents[index].id!),
                ),
                onPdfOpen: () => bloc.add(
                  OnOpenItem(itemModelDto: state.accidents[index]),
                ),
                onDownload: () => bloc.add(
                  OnDownloadItem(itemModelDto: state.accidents[index]),
                ),
                onContinue: () => bloc.add(
                  OnContinueItem(itemModelDto: state.accidents[index], reportType: ReportType.accident),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: state.accidents.length);
      },
    );
  }
}
