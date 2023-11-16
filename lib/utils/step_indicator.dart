// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepIndicator extends StatelessWidget {
  //
  final String title;
  final String? trailingTitle;

  final int currentStep;
  final int totalSteps;

  const StepIndicator({
    super.key,
    required this.title,
    this.currentStep = 1,
    this.totalSteps = 12,
    //
    this.trailingTitle,
  });

  @override
  Widget build(BuildContext context) {
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
                  text: title,
                ),
                if (trailingTitle != null)
                  TextSpan(
                    text: ' $trailingTitle',
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
            totalSteps: totalSteps,
            currentStep: currentStep,
            unselectedColor: Colors.black,
            roundedEdges: const Radius.circular(10),
            selectedColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
