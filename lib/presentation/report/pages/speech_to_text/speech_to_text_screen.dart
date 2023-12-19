// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/speech_to_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/speech_to_text_screen_mode.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/speech_to_text_cubit.dart';

class SpeechToTextScreen extends StatefulWidget {
  //
  static const route = '/speech_to_text';

  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  //
  late SpeechToTextCubit bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as SpeechToTextArgs;
    bloc = SpeechToTextCubit(
      speechToTextScreenMode: args.mode,
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextCubit, SpeechToTextState>(
      bloc: bloc,
      builder: (context, state) {
        return KeyboardEscape(
          child: SafeArea(
            child: Scaffold(
              body: ListView(
                padding: const EdgeInsets.all(32),
                children: [
                  StepIndicator(
                    currentStep: bloc.getStep(),
                    showTrailingTitle: true,
                  ),
                  const SizedBox(height: 52),
                  SpeechToTextField(
                    maxLines: 10,
                    labelText: bloc.title,
                    isRecording: state.isRecording,
                    controller: bloc.textController,
                    toggleRecording: bloc.toggleRecording,
                  ),
                ],
              ),
              floatingActionButton: NavigationButton(
                loading: state.status == Status.loading,
                onNextTap: bloc.onNextTap,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        );
      },
    );
  }
}

class SpeechToTextArgs {
  final SpeechToTextScreenMode mode;

  SpeechToTextArgs({required this.mode});
}
