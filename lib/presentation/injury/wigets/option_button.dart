// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_ink_well.dart';

class InjuryOptionButton extends StatelessWidget {
  //
  final bool _isPositve;
  final bool isSelected;

  final void Function() onTap;

  const InjuryOptionButton.yes({
    super.key,
    required this.isSelected,
    required this.onTap,
  }) : _isPositve = true;

  const InjuryOptionButton.no({
    super.key,
    required this.isSelected,
    required this.onTap,
  }) : _isPositve = false;

  @override
  Widget build(BuildContext context) {
    return MyInkWell(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 26,
      ),
      borderRadius: BorderRadius.circular(50),
      color: isSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.onSecondary,
      child: Text(
        _isPositve ? 'strYes'.tr() : 'strNo'.tr(),
      ),
    );
  }
}
