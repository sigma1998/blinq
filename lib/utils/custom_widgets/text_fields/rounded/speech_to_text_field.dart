// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/custom_widgets/wave.dart';

class SpeechToTextField extends StatelessWidget {
  //
  final String? labelText;

  final bool isRecording;
  final double? soundLevel;
  final void Function() toggleRecording;

  final TextEditingController? controller;
  final ScrollController? scrollController;

  final TextStyle? labelTextstyle;
  final TextStyle? inputTextstyle;

  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool isLoading;

  final FocusNode? focusNode;

  final int? minLines;
  final int maxLines;
  final int? maxLength;

  final void Function()? onTap;

  const SpeechToTextField({
    super.key,
    this.labelText,
    //
    required this.isRecording,
    required this.toggleRecording,
    this.soundLevel,
    //
    this.controller,
    this.scrollController,
    //
    this.labelTextstyle = const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
    ),
    this.inputTextstyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    //
    this.floatingLabelBehavior,
    //
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.isLoading = false,
    //
    this.focusNode,
    //
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    //
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  labelText!,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (isLoading) ...[
                const SizedBox(width: 8),
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: Loading(),
                ),
              ],
            ],
          ),
          const SizedBox(height: 36),
        ],
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: enabled
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.onSecondary,
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ).copyWith(top: 16),
          child: Column(
            children: [
              TextFormField(
                scrollController: scrollController,
                controller: controller,
                //
                focusNode: focusNode,
                enabled: enabled,
                readOnly: readOnly,
                autofocus: autofocus,
                textAlign: TextAlign.start,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.none,
                //
                minLines: minLines,
                maxLines: maxLines,
                maxLength: maxLength,
                //
                onTap: onTap,
                //
                style: inputTextstyle,
                decoration: InputDecoration(
                  isDense: true,
                  //
                  contentPadding: EdgeInsets.zero,
                  floatingLabelBehavior: floatingLabelBehavior,
                  //
                  filled: true,
                  fillColor: enabled
                      ? Theme.of(context).colorScheme.onBackground
                      : Theme.of(context).colorScheme.onSecondary,
                  //
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 24,
                    maxHeight: 24,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              WaveWidget(
                animate: isRecording,
                scale: soundLevel ?? 0,
                onPressed: toggleRecording,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
