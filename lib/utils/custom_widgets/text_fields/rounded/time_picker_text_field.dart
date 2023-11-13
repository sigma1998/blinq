// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/date_formatter.dart';
import 'package:blinq/utils/date_helper.dart';
import 'rounded_text_field.dart';

class RoundedTimePickerTextField extends StatefulWidget {
  //
  final String? labelText;
  final TimeOfDay? initialTime;

  final void Function(DateTime)? onDateChanged;
  final TextEditingController controller;

  final bool enabled;
  final bool isRequired;

  RoundedTimePickerTextField({
    required this.controller,
    this.labelText,
    this.onDateChanged,
    //
    this.initialTime,
    //
    this.enabled = true,
    this.isRequired = false,
  }) : super(key: UniqueKey());

  @override
  State<RoundedTimePickerTextField> createState() =>
      _RoundedTimePickerTextFieldState();
}

class _RoundedTimePickerTextFieldState
    extends State<RoundedTimePickerTextField> {
  //
  TimeOfDay? time;

  @override
  void initState() {
    time = widget.initialTime ?? TimeOfDay.now();
    if (widget.initialTime != null) setText();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedTextField(
      onTap: onTap,
      readOnly: true,
      enabled: widget.enabled,
      hintText: 'strTime'.tr(),
      labelText: widget.labelText,
      controller: widget.controller,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SvgPicture.asset(
          AppDrawables.time,
          width: 24,
          height: 24,
        ),
      ),
      suffixIconConstraints: const BoxConstraints(
        minWidth: 24,
        minHeight: 24,
      ),
    );
  }

  void onTap() async {
    final newDate = await showTimePicker(
      context: context,
      initialTime: time!,
    );

    if (newDate != null) {
      time = newDate;
      setText();
      // widget.onDateChanged(dateTime!);
    }
  }

  void setText() {
    widget.controller.text = DateFormatter.fhhmm(
      MyDateHelper.timeOfDayToDateTime(time!),
    );
  }
}
