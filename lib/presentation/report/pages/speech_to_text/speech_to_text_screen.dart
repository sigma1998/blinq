// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/report/pages/speech_to_text/bloc/speech_to_text_screen_bloc.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/text_fields/rounded/speech_to_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/step_indicator.dart';

// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/speech_to_text_screen_mode.dart';

class SpeechToTextScreen extends StatefulWidget {
  //
  static const route = '/speech_to_text';

  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  late SpeechToTextScreenBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as SpeechToTextArgs;
    bloc = SpeechToTextScreenBloc(
      speechToTextScreenMode: args.mode,
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      reportBloc: context.read<ReportBloc>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextScreenBloc, GenericBlocState>(
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
                    canClear: false,
                    labelText: bloc.title,
                    controller: bloc.textController,
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
