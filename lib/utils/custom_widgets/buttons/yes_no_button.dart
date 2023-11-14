// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'default_ink_well.dart';

class YesNoButton extends StatefulWidget {
  //

  final void Function(bool) onChanged;

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
        MyInkWell(
          onTap: onNoTap,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 26,
          ),
          borderRadius: BorderRadius.circular(50),
          color: isNoSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSecondary,
          child: Text('strNo'.tr()),
        ),
        const SizedBox(width: 18),
        MyInkWell(
          onTap: onYesTap,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 26,
          ),
          borderRadius: BorderRadius.circular(50),
          color: isYesSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onSecondary,
          child: Text('strYes'.tr()),
        )
      ],
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
