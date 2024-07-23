// Flutter imports:
import 'package:blinq/core/theme/app_colors.dart';
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
  final TextEditingController? controller;

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
    if(widget.controller?.text == 'no validity') return;

    final today = MyDateHelper.today;

    final newDate = await showDatePicker(
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      initialDate: dateTime!,
      lastDate: widget.maxDate ?? DateTime(today.year + 100),
      firstDate: widget.minDate ?? DateTime(today.year - 100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.white,
              onPrimary: Colors.black,
              secondary: AppColors.darkGrey,
              onSecondary: AppColors.grey1,
              onSecondaryContainer: AppColors.lightGrey2,
              error: Colors.red,
              onError: Colors.white,
              background: Colors.black,
              onBackground: AppColors.darkGrey,
              surface: AppColors.darkGrey,
              onSurface: Colors.white,
              outline: AppColors.grey2,
              outlineVariant: AppColors.lightGrey,
              tertiary: AppColors.lightGreyVariant,
              secondaryContainer: AppColors.darkGreyVarient,
              surfaceVariant: AppColors.messageBackgroundColor,
              inversePrimary: AppColors.darkRedColor,
              onSurfaceVariant: AppColors.lightGrey3,
            )
          ),
          child: child ?? Container(),
        );
      },
    );

    if (newDate != null) {
      dateTime = newDate;
      setText();
      // widget.onDateChanged(dateTime!);
    }
  }

  void setText() {
    widget.controller?.text = DateFormatter.fyyyyMMdd(dateTime);
  }
}
