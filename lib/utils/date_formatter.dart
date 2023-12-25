// Package imports:
import 'package:intl/intl.dart';

class DateFormatter {
  //
  DateFormatter._();

  static String format(DateTime? date, String pattern) {
    return date != null ? DateFormat(pattern).format(date) : '';
  }

  static DateTime? parse(String? date, String pattern) {
    return date != null && date.isNotEmpty
        ? DateFormat(pattern).parse(date)
        : null;
  }

  /// eg. 24/12/2022
  static String fddMMyyyySlash(DateTime? date) =>
      format(date, DateFormats.ddMMyyyySlash);
  static DateTime? pddMMyyyySlash(String date) =>
      parse(date, DateFormats.ddMMyyyySlash);

  /// eg. 24 Dec 2022, 07:43pm
  static String fddMMMyyyyCommaHHmm(DateTime? date) =>
      format(date, DateFormats.ddMMMyyyyCommaHHmm);
  static DateTime? pddMMMyyyyCommaHHmm(String date) => parse(
        date,
        DateFormats.ddMMMyyyyCommaHHmm,
      );

  // eg. 2022-12-24
  static String fyyyyMMdd(DateTime? date) => format(date, DateFormats.yyyyMMdd);
  static DateTime? pyyyyMMdd(String date) => parse(date, DateFormats.yyyyMMdd);

  // eg. 23:47
  static String fhhmm(DateTime? date) => format(date, DateFormats.hhmm);
  static DateTime? phhmm(String date) => parse(date, DateFormats.hhmm);
}

class DateFormats {
  //
  DateFormats._();

  static const String ddMMyyyySlash = 'dd/MM/yyyy';
  static const String ddMMMyyyyCommaHHmm = 'dd MMM yyyy, hh:mma';
  static const String yyyyMMdd = 'yyyy-MM-dd';
  static const String hhmm = 'HH:mm';
}
