// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:in_date_utils/in_date_utils.dart';

class MyDateHelper {
  //
  static DateTime get today {
    final today = DateTime.now();
    return DateTime(today.year, today.month, today.day);
  }

  static DateTime get yesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return DateTime(yesterday.year, yesterday.month, yesterday.day);
  }

  static DateTime get tommorow {
    final tommorow = DateTime.now().add(const Duration(days: 1));
    return DateTime(tommorow.year, tommorow.month, tommorow.day);
  }

  static DateTime get currentMonth {
    final today = DateTime.now();
    return DateTime(today.year, today.month);
  }

  static DateTime get prevMonth {
    final today = DateTime.now();
    bool isJanuary = today.month == 1;
    final month = isJanuary ? 12 : today.month - 1;
    final year = isJanuary ? today.year - 1 : today.year;
    return DateTime(year, month);
  }

  static DateTime get nextMonth {
    final today = DateTime.now();
    return DateTimeUtils.addMonths(DateTime(today.year, today.month), 1);
  }

  static bool isToday(DateTime date) {
    return DateTimeUtils.isSameDay(date, DateTime.now());
  }

  static bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  static bool isSameMonth(DateTime? a, DateTime? b) {
    return a?.year == b?.year && a?.month == b?.month;
  }

  static bool isCurrentMonth(DateTime date) {
    return today.year == date.year && today.month == date.month;
  }

  static DateTime timeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  static String daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round().toString();
  }
}
