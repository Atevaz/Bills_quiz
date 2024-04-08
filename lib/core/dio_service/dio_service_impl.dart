import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'dio_provider.dart';
import 'dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  DioProvider dioProvider;

  DioServiceImpl({
    required this.dioProvider,
  });

  @override
  Future<Response> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      'Authorization': 'Basic Og==102.42.73.68',
      'x-api-key': 'AAAAuhxRITI:APA91bHEZdFgYXEMCtj36-L--KdHld-V7Mj2nJY3XN9vJcQvzaNXCKddsy8f5-aQBrrJh9MsEeA0kLmWTnlpoG1xKRjF2Jrg1PevXO1cSBG-cFORr55HlFgPxQ_JpToXsA_sFKa51EXE',
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      'Authorization': 'Basic Og==102.42.73.68',
      'x-api-key': 'AAAAuhxRITI:APA91bHEZdFgYXEMCtj36-L--KdHld-V7Mj2nJY3XN9vJcQvzaNXCKddsy8f5-aQBrrJh9MsEeA0kLmWTnlpoG1xKRjF2Jrg1PevXO1cSBG-cFORr55HlFgPxQ_JpToXsA_sFKa51EXE',
    };

    if(base != null) {
      dio.options.baseUrl = base ;
    }

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> delete(
      {String? base,
      required String endPoint,
      data,
      query,
      String? token,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.delete(
      endPoint,
      data: data,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> put(
      {String? base,
      required String endPoint,
      data,
      query,
      String? token,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false,
        ProgressCallback? progressCallback,
      }) async {
    final dio = dioProvider.get();

    if (timeOut != null) {
      dio.options.connectTimeout = Duration(milliseconds: timeOut);
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.put(
      endPoint,
      data: data,
      queryParameters: query,
      onReceiveProgress: progressCallback ,
      cancelToken: cancelToken,
    );
  }
}
