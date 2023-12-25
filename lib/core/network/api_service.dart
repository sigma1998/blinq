// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'dio_client.dart';

class AppApi {
  // Get
  Future<dynamic> get(
    String uri, {
    token,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await DioClient.myDio.get(
        uri,
        queryParameters: queryParameters,
        // options: Options(headers: {"Authorization": token}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Get
  Future<List> getList(
    String uri, {
    token,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await DioClient.myDio.get(
        uri,
        queryParameters: queryParameters,
        // options: Options(headers: {"Authorization": token}),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Post
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await DioClient.myDio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint('0ri09t8409583-4059-3405930-495-03495-034');
      debugPrint(response.data.toString());
      debugPrint('0ri09t8409583-4059-3405930-495-03495-034');

      return response.data;
    } catch (e) {
      debugPrint('0ri09t8409583-4059werfdggvdfe-3405930-495-03495-034');

      rethrow;
    }
  }

  // Patch
  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await DioClient.myDio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Put
  Future<dynamic> put(
    String uri, {
    token,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await DioClient.myDio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Delete
  Future<dynamic> delete(
    String uri, {
    token,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await DioClient.myDio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // Download
  Future<dynamic> download(
    String uri,
    String savePath, {
    token,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      DioClient.myDioOptions.headers = {};
      final Response response = await DioClient.myDio.download(uri, savePath,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      DioClient.myDioOptions.headers = {
        'Content-Type': 'application/json; charset=utf-8'
      };
      return response.data;
    } catch (e) {
      throw 'common.file_downloading_error'.tr();
    }
  }
}
