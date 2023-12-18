// Flutter imports:
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/presentation/my_reports/bloc/reports_screen_bloc.dart';
import 'package:blinq/presentation/my_reports/bloc/reports_screen_event.dart';
import 'package:blinq/presentation/my_reports/bloc/reports_screen_state.dart';
import 'package:blinq/presentation/my_reports/widgets/items/report_item.dart';

// Project imports:
import 'package:blinq/presentation/my_reports/widgets/states/empty_state.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

class BreakdownReportsView extends StatelessWidget {
  //
  const BreakdownReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReportsScreenBloc>();

    return BlocBuilder<ReportsScreenBloc, ReportsScreenState>(
      builder: (context, state) {
        final isLoading = state.status == Status.loading;

        if (state.breakdowns.isEmpty) return const ReportsEmptyStateWidget();

        if (isLoading) return const Loading();

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 21),
          itemBuilder: (context, index) {
            return ProfileReportItem(
              historyItemModelDto: state.breakdowns[index],
              onDelete: () => bloc.add(
                OnItemDelete(id: state.breakdowns[index].id!),
              ),
              onPdfOpen: () => bloc.add(
                OnOpenItem(itemModelDto: state.breakdowns[index]),
              ),
              onDownload: () => bloc.add(
                OnDownloadItem(itemModelDto: state.breakdowns[index]),
              ),
              onContinue: () => bloc.add(
                OnContinueItem(
                    itemModelDto: state.breakdowns[index],
                    reportType: ReportType.breakdown),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: state.breakdowns.length,
        );
      },
    );
  }
}
