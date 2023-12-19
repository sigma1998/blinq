// Flutter imports:
import 'package:avatar_glow/avatar_glow.dart';
import 'package:blinq/utils/speech_to_text_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';

class SpeechToTextField extends StatefulWidget {
  //
  final String? labelText;

  final TextEditingController? controller;

  final TextStyle? labelTextstyle;
  final TextStyle? inputTextstyle;

  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool canClear;
  final bool isLoading;

  final FocusNode? focusNode;

  final int? minLines;
  final int maxLines;
  final int? maxLength;

  final void Function()? onTap;

  const SpeechToTextField({
    super.key,
    this.labelText,
    this.controller,
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
    this.canClear = true,
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
  State<SpeechToTextField> createState() => _SpeechToTextFieldState();
}

class _SpeechToTextFieldState extends State<SpeechToTextField> {
  //
  late FocusNode focusNode;
  late TextEditingController controller;

  bool isRecording = false;

  bool get showClear =>
      widget.canClear && focusNode.hasFocus && controller.text.isNotEmpty;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();

    if (widget.canClear) {
      controller.addListener(updateState);
      focusNode.addListener(updateState);
    }
    super.initState();
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  void dispose() {
    if (widget.canClear) {
      controller.removeListener(updateState);
      focusNode.removeListener(updateState);
    }
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.labelText!,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              if (widget.isLoading) ...[
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
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
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
                    controller: controller,
                    //
                    focusNode: focusNode,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.white,
                    autofocus: widget.autofocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.none,
                    //
                    minLines: widget.minLines,
                    maxLines: widget.maxLines,
                    maxLength: widget.maxLength,
                    //
                    onTap: widget.onTap,
                    //
                    style: widget.inputTextstyle,
                    decoration: _decoration,
                  ),
                  AvatarGlow(
                    endRadius: 75.0,
                    animate: isRecording,
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: const Duration(seconds: 2),
                    glowColor: Theme.of(context).colorScheme.onSecondary,
                    repeatPauseDuration: const Duration(milliseconds: 100),
                    repeat: true,
                    child: SizedBox(
                      height: 76,
                      width: 76,
                      child: FloatingActionButton(
                        onPressed: toggleRecording,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        child: Icon(
                          isRecording ? Icons.mic : Icons.mic_none,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showClear && widget.maxLines > 1)
              Positioned(
                top: 8,
                right: 6,
                child: clearButton(),
              ),
          ],
        ),
      ],
    );
  }

  Future toggleRecording() => SpeechToTextHelper.toggleRecording(
        onResult: (text) {
          controller.text = text;
          controller.selection = TextSelection.fromPosition(
            TextPosition(
              offset: controller.text.length,
            ),
          );
        },
        onListening: (isListening) {
          isRecording = isListening;
          updateState();

          if (!isListening) {
            controller.selection = TextSelection.fromPosition(
              TextPosition(
                offset: controller.text.length,
              ),
            );
          }
        },
      );

  InputDecoration get _decoration {
    return InputDecoration(
      isDense: true,
      //
      contentPadding: EdgeInsets.zero,
      floatingLabelBehavior: widget.floatingLabelBehavior,
      //
      filled: true,
      fillColor: widget.enabled
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
    );
  }

  Widget clearButton() {
    return GestureDetector(
      onTap: onClear,
      child: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          CupertinoIcons.xmark_circle,
          size: 28,
          color: Colors.grey,
        ),
      ),
    );
  }

  void onClear() => controller.clear();
}
