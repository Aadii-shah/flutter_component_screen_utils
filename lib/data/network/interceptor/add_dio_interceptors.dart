import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void addDioInterceptors(Dio dio) {
  if (kDebugMode) {
    dio.interceptors.add(
      PrettyDioLogger(error: true, requestBody: true, requestHeader: false, request: true, responseBody: true),
    );

    dio.interceptors.add(ChuckerDioInterceptor());
  }
}
