// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/report/pages/damaged_media/cubit/damaged_media_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DamagedMediaLoadingStateWidget extends StatelessWidget {
  //
  const DamagedMediaLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DamagedMediaCubit, DamagedMediaState>(
      builder: (context, state) {
        final totalSteps = state.files.isEmpty ? 1 : state.files.length;
        final currentStep = state.uploadedFilesId.length;

        return Container(
          color: Colors.black26,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                AppDrawables.blinqLoadingAnim,
              ),
              const SizedBox(height: 20),
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
            ],
          ),
        );
      },
    );
  }
}
