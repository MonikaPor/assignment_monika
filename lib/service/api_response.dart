import 'package:dio/dio.dart';

class ApiResponse<T> {
  ApiResponseStatus status;
  T? data;

  ApiResponse.completed(this.data) : status = ApiResponseStatus.complete;

  ApiResponse.error(DioError error) : status = ApiResponseStatus.error;
}

enum ApiResponseStatus { complete, error }
