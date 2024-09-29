// Flutter imports:
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/custom_widgets/text_fields/rounded/speech_to_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import '../../../../domain/bloc/report_bloc/report_type.dart';
import 'bloc/speech_to_text_cubit.dart';
import 'bloc/speech_to_text_screen_mode.dart';

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
  bool focus = false;
  int? step;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as SpeechToTextArgs;
    step = args.step;
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
              appBar: ProgressAppBar(
                step: step ?? 3,
                onSaveTap: bloc.onNextTap,
              ),
              body: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 24),
                  SpeechToTextField(
                    autofocus: focus,
                    maxLines: 10,
                    labelText: bloc.title,
                    soundLevel: state.soundLevel,
                    isRecording: state.isRecording,
                    controller: bloc.textController,
                    scrollController: bloc.scrollController,
                    toggleRecording: () =>
                        bloc.toggleRecording(context.locale.languageCode),
                    onKeyBoardTap: () {
                      setState(() {
                        focus = !focus;
                      });
                    },
                  ),
                ],
              ),
              floatingActionButton: NavigationButton(
                padding: 16,
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
  final int? step;

  SpeechToTextArgs({
    required this.mode,
    this.step,
  });
}
