import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void localDateFormat(BuildContext context,
    {TextEditingController? textEditingController, DateTime? firstDate}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), //get today's date
    firstDate:
        DateTime(1900), //DateTime.now() - not to allow to choose before today.
    lastDate: firstDate ?? DateTime(2100),
  );
  if (pickedDate != null) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

    textEditingController?.text = formattedDate;
  } else {
    debugPrint("Date is not selected");
  }
}

String dateFormatWithoutTime(String? date, {String format = "yyyy-MM-dd"}) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dateValue = DateFormat(date.contains('T') ? 'yyyy-MM-dd' : "yyyy-MM-dd")
      .parse(date, true)
      .toLocal();
  return DateFormat(format).format(dateValue);
}

String dateFormat(String? date, {String format = "yyyy-MM-dd"}) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dateValue = DateFormat(
          date.contains('T') ? 'yyyy-MM-ddTHH:mm:ssZ' : "yyyy-MM-dd HH:mm:ssZ")
      .parse(date, true)
      .toLocal();
  return DateFormat(format).format(dateValue);
}

String timeFormat(String? date, {String format = "HH:mm"}) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dateValue = DateFormat(
          date.contains('T') ? 'yyyy-MM-ddTHH:mm:ssZ' : "yyyy-MM-dd HH:mm:ssZ")
      .parse(date, true)
      .toLocal();
  return DateFormat(format).format(dateValue);
}

String getReportTime(String? date) {
  return "${dateFormat(date, format: "dd")}. ${getMonthName(int.parse(dateFormat(date, format: "MM")))} ${dateFormat(date, format: "yyyy")}, ${timeFormat(date)}";
}

String getDateWithoutTime(String? date) {
  return "${dateFormatWithoutTime(date, format: "dd")} ${getMonthName(int.parse(dateFormatWithoutTime(date, format: "MM")))} ${dateFormatWithoutTime(date, format: "yyyy")}";
}

String getMonthName(int month) {
  switch (month) {
    case 1:
      return "january".tr();
    case 2:
      return "february".tr();
    case 3:
      return "march".tr();
    case 4:
      return "april".tr();
    case 5:
      return "may".tr();
    case 6:
      return "june".tr();
    case 7:
      return "july".tr();
    case 8:
      return 'august'.tr();
    case 9:
      return 'september'.tr();
    case 10:
      return 'october'.tr();
    case 11:
      return 'november'.tr();
    case 12:
      return 'december'.tr();
  }
  return '';
}

String generateRandomString(int length) {
  // const chars =
  //     'abcdefghijklmnopqrstuvwxyz0123456789'; // Define the characters you want in your random string
  // final random = Random();
  // final String randomString =
  //     List.generate(length, (index) => chars[random.nextInt(chars.length)])
  //         .join();
  return DateTime.now().millisecondsSinceEpoch.toString();
}
