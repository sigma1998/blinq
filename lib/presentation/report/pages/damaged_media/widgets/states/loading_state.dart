// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/damaged_media/cubit/damaged_media_cubit.dart';
import 'package:blinq/utils/custom_widgets/loading/blinq_loading.dart';

class DamagedMediaLoadingStateWidget extends StatelessWidget {
  //
  const DamagedMediaLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DamagedMediaCubit, DamagedMediaState>(
      builder: (context, state) {
        final totalSteps = state.files.isEmpty ? 1 : state.files.length;
        final currentStep = state.uploadedFilesId.length;

        return BlinqLoading(children: [
          SizedBox(
            width: 130,
            child: StepProgressIndicator(
              size: 8,
              padding: 0,
              totalSteps: totalSteps,
              currentStep: currentStep,
              roundedEdges: const Radius.circular(10),
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ]);
      },
    );
  }
}
