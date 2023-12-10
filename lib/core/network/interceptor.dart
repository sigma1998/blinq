import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import 'custom_error.dart';

class CustomInterceptor extends Interceptor {
  // CustomInterceptor({required this.dio});
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      NavigationService.showErrorToast('common.low_internet_connection'.tr());
      return handler.next(err);
    }
    int statusCode = (err.response?.statusCode ?? 0);
    if (statusCode == 400 &&
        err.requestOptions.path == NetworkConstants.createReport) {
      final data = err.response!.data;
      final list = data['active_accidents'];

      return handler.next(HaveActiveReportException(
          accidentId: list[0], requestOptions: err.requestOptions));
    }
    // else if (statusCode >= 400 && statusCode <= 500) {
    //   final text =
    //       err.response!.data?['message'] ?? err.response!.data['detail'];
    //   NavigationService.showErrorToast((text).toString());
    // }

    return handler.next(err);
  }
}
