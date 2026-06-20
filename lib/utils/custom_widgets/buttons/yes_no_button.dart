// Flutter imports:
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'default_ink_well.dart';

class YesNoButton extends StatefulWidget {
  //

  final void Function(bool?) onChanged;

  const YesNoButton({
    super.key,
    //
    required this.onChanged,
  });

  @override
  State<YesNoButton> createState() => _YesNoButtonState();
}

class _YesNoButtonState extends State<YesNoButton> {
  //
  bool isYesSelected = false;
  bool isNoSelected = false;

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        getButton(
          onTap: onYesTap,
          clicked: isYesSelected,
          text: 'strYes'.tr(),
        ),
        const SizedBox(width: 24),
        getButton(
          clicked: isNoSelected,
          text: 'strNo'.tr(),
          onTap: onNoTap,
        ),
      ],
    );
  }

  getButton({
    required bool clicked,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.white,
                width: clicked  ? 7 : 1.5,
              ),
            ),
            padding: const EdgeInsets.all(6),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.s20W400,
          )
        ],
      ),
    );
  }

  void onYesTap() {
    isYesSelected = true;
    isNoSelected = false;
    widget.onChanged.call(true);
    updateState();
  }

  void onNoTap() {
    isYesSelected = false;
    isNoSelected = true;
    widget.onChanged.call(false);
    updateState();
  }
}
