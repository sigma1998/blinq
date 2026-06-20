// Flutter imports:

// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/wrappers/glass_container.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/custom_widgets/wave.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpeechToTextField extends StatefulWidget {
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
  final VoidCallback? onKeyBoardTap;
  final String? hint;

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
    this.onKeyBoardTap,
    this.hint,
  });

  @override
  State<SpeechToTextField> createState() => _SpeechToTextFieldState();
}

class _SpeechToTextFieldState extends State<SpeechToTextField> {
  final FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.labelText != null) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.labelText!,
                  maxLines: 3,
                  style: AppTextStyles.s22W600,
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
        SizedBox(
          height: 120.h,
          width: double.infinity,
          child: GlassContainer(
            radius: 10,
            padding: const EdgeInsets.only(
              left: 16,
              top: 12,
            ),
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    scrollController: widget.scrollController,
                    controller: widget.controller,
                    //
                    focusNode: widget.focusNode ?? focus,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    autofocus: widget.autofocus,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.white,
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
                    decoration: InputDecoration(
                      isDense: true,
                      //
                      contentPadding: EdgeInsets.zero,
                      floatingLabelBehavior: widget.floatingLabelBehavior,
                      //
                      filled: true,
                      hintText: widget.hint,
                      hintStyle: AppTextStyles.s17W600.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff737373),
                      ),
                      fillColor: Colors.transparent,
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
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     IconButton(
                //       onPressed: () {
                //         FocusScope.of(context).requestFocus(widget.focusNode ?? focus);
                //       },
                //       icon: SvgPicture.asset(
                //         AppDrawables.keyboard,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
        SizedBox(height: 80.h),
        SizedBox(
          width: 114.h,
          child: AnimatedContainer(
            width: 112.h,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.enabled ? AppColors.darkGrey : Theme.of(context).colorScheme.onSecondary,
            ),
            child: WaveWidget(
              animate: widget.isRecording,
              scale: widget.soundLevel ?? 0,
              onPressed: widget.toggleRecording,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }
}
