// Flutter imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/date_formatter.dart';
import 'package:blinq/utils/date_helper.dart';
import 'package:flutter_svg/svg.dart';
import 'rounded_text_field.dart';

class RoundedDatePickerTextField extends StatefulWidget {
  //
  final String labelText;
  final DateTime? initialDate;

  final void Function(DateTime)? onDateChanged;
  final TextEditingController controller;

  final DateTime? minDate;
  final DateTime? maxDate;

  final bool enabled;
  final bool isRequired;

  RoundedDatePickerTextField({
    required this.controller,
    this.labelText = '',
    this.onDateChanged,
    //
    this.initialDate,
    //
    this.minDate,
    this.maxDate,
    //
    this.enabled = true,
    this.isRequired = false,
  }) : super(key: UniqueKey());

  @override
  State<RoundedDatePickerTextField> createState() =>
      _RoundedDatePickerTextFieldState();
}

class _RoundedDatePickerTextFieldState
    extends State<RoundedDatePickerTextField> {
  //
  DateTime? dateTime;

  @override
  void initState() {
    dateTime = widget.initialDate ?? MyDateHelper.today;
    if (widget.initialDate != null) setText();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedTextField(
      onTap: onTap,
      readOnly: true,
      enabled: widget.enabled,
      hintText: 'strDate'.tr(),
      labelText: widget.labelText,
      controller: widget.controller,
      suffixIcon: SvgPicture.asset(
        AppDrawables.calendar,
        width: 24,
        height: 24,
      ),
    );
  }

  void onTap() async {
    final today = MyDateHelper.today;

    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime!,
      lastDate: widget.maxDate ?? DateTime(today.year + 20),
      firstDate: widget.minDate ?? DateTime(today.year - 20),
    );

    if (newDate != null) {
      dateTime = newDate;
      setText();
      // widget.onDateChanged(dateTime!);
    }
  }

  void setText() {
    widget.controller.text = DateFormatter.fyyyyMMdd(dateTime);
  }
}
