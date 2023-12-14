// Flutter imports:
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc_state.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepIndicator extends StatelessWidget {
  //
  final bool showTrailingTitle;

  final int currentStep;

  const StepIndicator({
    super.key,
    this.currentStep = 1,
    //
    this.showTrailingTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    final reportBloc = context.read<ReportBloc>();
    return BlocBuilder<ReportBloc, ReportState>(builder: (context, state){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).colorScheme.secondary,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 32,
        ),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: reportBloc.reportType == ReportType.accident
                        ? 'strAccident'.tr()
                        : 'strBreakDown'.tr(),
                  ),
                  if (showTrailingTitle && reportBloc.reportType == ReportType.accident)
                    TextSpan(
                      text:
                      '  ${'strDriver'.tr()} ${state.user == User.A ? 'A' : 'B'}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            StepProgressIndicator(
              size: 8,
              padding: 0,
              totalSteps: reportBloc.reportType == ReportType.accident ? 17 : 10,
              currentStep: currentStep,
              unselectedColor: Colors.black,
              roundedEdges: const Radius.circular(10),
              selectedColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      );
    });
  }
}
