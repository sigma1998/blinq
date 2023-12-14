import 'package:dio/dio.dart';

class HaveActiveReportException extends DioError {
  final int id;
  final String reportType;
  final String createdAt;

  HaveActiveReportException(
      {required this.id,
      required this.reportType,
      required this.createdAt,
      required super.requestOptions});
}
