import 'package:dio/dio.dart';

import 'interceptor.dart';

class DioClient {
  static Dio clickStartDio = _createDio();
  static Dio? _clickStartDio;

  static final clickStartDioOptions = BaseOptions(
      baseUrl: 'http://64.226.89.185/v1/api/',
      connectTimeout: 2000000,
      receiveTimeout: 2000000,
      // queryParameters: {
      //   'lang': NavigationService
      //           .navigatorKey.currentContext?.locale.languageCode ??
      //       'ru'
      // },
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      responseType: ResponseType.json);

  static final logInterceptor = LogInterceptor(
    request: true,
    responseBody: true,
    requestBody: true,
    requestHeader: true,
  );

  static Dio _createDio() {
    _clickStartDio ??= Dio(clickStartDioOptions)
      ..interceptors.addAll([CustomInterceptor(), logInterceptor]);
    return _clickStartDio!;
  }

  static void toggleMultipartFormData(bool isOn) {
    if (isOn) {
      clickStartDio.options.headers['Content-Type'] = 'multipart/form-data';
    } else {
      clickStartDio.options.headers['Content-Type'] =
          'application/json; charset=utf-8';
    }
  }

  static void setDeviceId(String? deviceId) {
    if (deviceId == null) {
      clickStartDio.options.headers.remove('Device-id');
    } else {
      clickStartDio.options.headers['Device-id'] = deviceId;
    }
  }

  static void setSessionKey(String? sessionKey) {
    if (sessionKey == null) {
      clickStartDio.options.headers.remove('Session-key');
    } else {
      clickStartDio.options.headers['Session-key'] = sessionKey;
    }
  }

  static void setToken(String? token) {
    if (token == null) {
      clickStartDio.options.headers.remove('token');
    } else {
      clickStartDio.options.headers['token'] = token;
    }
  }

  static void setConfirmCode(int? code) {
    if (code == null) {
      clickStartDio.options.headers.remove('confirm-code');
    } else {
      clickStartDio.options.headers['confirm-code'] = code;
    }
  }

  static void setLanguage(String? languageCode){
    if (languageCode == null) {
      clickStartDio.options.headers.remove('Accept-Language');
    } else {
      clickStartDio.options.headers['Accept-Language'] = languageCode;
    }

  }
  
}
