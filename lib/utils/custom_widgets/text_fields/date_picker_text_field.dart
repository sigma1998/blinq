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

  final void Function(DateTime) onDateChanged;

  final DateTime? minDate;
  final DateTime? maxDate;

  DatePickerTextField({
    required this.labelText,
    required this.onDateChanged,
    //
    this.initialDate,
    //
    this.minDate,
    this.maxDate,
    //
  }) : super(key: UniqueKey());

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  //
  DateTime? dateTime;

  final controller = TextEditingController();

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
      controller: controller,
      labelText: widget.labelText,
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
      widget.onDateChanged(dateTime!);
    }
  }

  void setText() {
    controller.text = DateFormatter.fddMMyyyySlash(dateTime);
  }
}
