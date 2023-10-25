
import 'package:blinq/utils/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.sendTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      NavigationService.showErrorToast('common.low_internet_connection'.tr());
      return handler.next(err);
    }

    return handler.next(err);
  }
}
