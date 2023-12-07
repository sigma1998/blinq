// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/utils/date_formatter.dart';
import 'package:blinq/utils/date_helper.dart';
import 'default_text_field.dart';

class DatePickerTextField extends StatefulWidget {
  //
  final String labelText;
  final DateTime? initialDate;

  final void Function(DateTime)? onDateChanged;
  final TextEditingController controller;

  final DateTime? minDate;
  final DateTime? maxDate;

  final bool enabled;
  final bool isRequired;

  DatePickerTextField({
    required this.labelText,
    required this.controller,
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
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
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
    return MyTextField(
      onTap: onTap,
      readOnly: true,
      enabled: widget.enabled,
      labelText: widget.labelText,
      controller: widget.controller,
    );
  }

  void onTap() async {
    final today = MyDateHelper.today;

    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime!,
      lastDate: widget.maxDate ?? DateTime(today.year + 100),
      firstDate: widget.minDate ?? DateTime(today.year - 100),
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
