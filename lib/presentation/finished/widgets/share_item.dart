// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/core/drawables/app_drawables.dart';

class FinishedShareItem extends StatelessWidget {
  //
  final String title;
  final String? icon;

  final VoidCallback onTap;

  //
  FinishedShareItem.insurance({
    super.key,
    required this.onTap,
  })  : title = 'strInsuranceCompany'.tr(),
        icon = null;

  FinishedShareItem.telegram({
    super.key,
    required this.onTap,
  })  : title = 'strTelegram'.tr(),
        icon = AppDrawables.telegram;

  FinishedShareItem.whatsapp({
    super.key,
    required this.onTap,
  })  : title = 'strWhatsapp'.tr(),
        icon = AppDrawables.whatsapp;

  FinishedShareItem.email({
    super.key,
    required this.onTap,
  })  : title = 'strEmail'.tr(),
        icon = AppDrawables.email;

  @override
  Widget build(BuildContext context) {
    return MyButton.tertiary(
      label: title,
      onTap: onTap,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      iconLeft: icon != null
          ? SvgPicture.asset(
              icon!,
              width: 20,
              height: 20,
            )
          : null,
    );
  }
}
