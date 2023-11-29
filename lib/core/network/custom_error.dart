import 'package:dio/dio.dart';

class HaveActiveReportException extends DioError {
  final int accidentId;

  HaveActiveReportException(
      {required this.accidentId, required super.requestOptions});
}