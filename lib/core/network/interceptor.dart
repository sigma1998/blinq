// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/presentation/offline/offline_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'custom_error.dart';

class CustomInterceptor extends Interceptor {
  final Dio dio;

  CustomInterceptor({required this.dio});

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout ||
        err.error is SocketException) {
      // NavigationService.showErrorToast('strBadConnection'.tr());
      // return handler.next(err);
      final bool? res =
          await NavigationService.pushNamed(routeName: OfflineScreen.route);
      if (res ?? false) {
        final retry = await dio.request(err.requestOptions.path,
            cancelToken: err.requestOptions.cancelToken,
            data: err.requestOptions.data,
            onReceiveProgress: err.requestOptions.onReceiveProgress,
            onSendProgress: err.requestOptions.onSendProgress,
            queryParameters: err.requestOptions.queryParameters,
            options: Options(
              method: err.requestOptions.method,
              sendTimeout: err.requestOptions.sendTimeout,
              receiveTimeout: err.requestOptions.receiveTimeout,
              extra: err.requestOptions.extra,
              headers: err.requestOptions.headers,
              responseType: err.requestOptions.responseType,
              contentType: err.requestOptions.contentType,
              validateStatus: err.requestOptions.validateStatus,
              receiveDataWhenStatusError:
                  err.requestOptions.receiveDataWhenStatusError,
              followRedirects: err.requestOptions.followRedirects,
              maxRedirects: err.requestOptions.maxRedirects,
              requestEncoder: err.requestOptions.requestEncoder,
              responseDecoder: err.requestOptions.responseDecoder,
              listFormat: err.requestOptions.listFormat,
            ));
        handler.resolve(retry);
      }
    }
    int statusCode = (err.response?.statusCode ?? 0);
    if (statusCode == 400 &&
        (err.requestOptions.path == NetworkConstants.createAccident ||
            err.requestOptions.path == NetworkConstants.createBreakdown)) {
      final data = err.response?.data;
      final list = data['active_reports'];

      return handler.next(HaveActiveReportException(
          id: list[0]['id'],
          reportType: list[0]['type'],
          createdAt: list[0]['created_datetime'],
          requestOptions: err.requestOptions));
    } else if (statusCode >= 400 && statusCode < 500) {
      String? text;
      try {
        final map = err.response?.data as Map<String, dynamic>;
        map.forEach((key, value) {
          text = value.toString();
        });
      } catch (e) {
        print('ERROR INTERCEPTOR_________$e');
      }
      text ??= 'Error';
      NavigationService.showErrorToast(
          (text! == 'Null' || text! == 'null') ? 'Error' : text!);
      // final text = err.response?.data?['message'] ??
      //     err.response?.data['detail'] ??
      //     err.response?.data['error'];
      // NavigationService.showErrorToast((text).toString());
    }

    return handler.next(err);
  }
}
