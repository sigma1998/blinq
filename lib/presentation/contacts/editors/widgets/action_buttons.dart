// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';

class EditorActionButtons extends StatelessWidget {
  //
  final int? id;

  final VoidCallback onDelete;
  final VoidCallback onSave;

  const EditorActionButtons({
    super.key,
    this.id,
    //
    required this.onDelete,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (id != null) ...[
          MyButton.tertiary(
            label: 'strDelete'.tr(),
            onTap: onDelete,
            labelStyle: const TextStyle(fontWeight: FontWeight.w500),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 52,
            ),
          ),
          const SizedBox(width: 12),
        ],
        MyButton.primary(
          label: 'strSave'.tr(),
          onTap: onSave,
          labelStyle: const TextStyle(fontWeight: FontWeight.w500),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 52,
          ),
        ),
      ],
    );
  }
}
