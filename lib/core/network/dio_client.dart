import 'package:dio/dio.dart';

import 'interceptor.dart';

class DioClient {
  static Dio myDio = _createDio();
  static Dio? _myDio;

  static final myDioOptions = BaseOptions(
      baseUrl: 'http://testingblinq.urinboev.uz/',
      connectTimeout: 20000,
      receiveTimeout: 20000,
      // queryParameters: {
      //   'lang': NavigationService
      //           .navigatorKey.currentContext?.locale.languageCode ??
      //       'ru'
      // },
      // headers: {'Content-Type': 'application/json; charset=utf-8'},
      // headers: {'Content-Type': 'charset=utf-8'},
      responseType: ResponseType.json);

  static final logInterceptor = LogInterceptor(
    request: true,
    responseBody: true,
    requestBody: true,
    requestHeader: true,
  );

  static Dio _createDio() {
    if(_myDio == null){
      _myDio ??= Dio(myDioOptions);
      _myDio!.interceptors.addAll([CustomInterceptor(dio: _myDio!), logInterceptor]);
    }
    return _myDio!;
  }

  static void toggleMultipartFormData(bool isOn) {
    if (isOn) {
      myDio.options.headers['Content-Type'] = 'multipart/form-data';
    } else {
      myDio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    }
  }

  static void setLanguage(String? languageCode) {
    if (languageCode == null) {
      myDio.options.headers.remove('Accept-Language');
    } else {
      myDio.options.headers['Accept-Language'] = languageCode;
    }
  }

  static void setToken(String? token) {
    if (token == null) {
      myDio.options.headers.remove('Authorization');
    } else {
      myDio.options.headers['Authorization'] = 'Bearer $token';
    }
  }
}
