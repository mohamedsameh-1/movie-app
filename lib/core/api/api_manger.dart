import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/api/api_constants.dart';

@singleton
class ApiManger {
  final dio = Dio();
  Future<Response> getData(
    String? path, {
    // apiConstants,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    final url = (path ?? ApiConstants.baseUrl) + endPoint;
    print((path ?? ApiConstants.baseUrl) + endPoint);
    return dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> patchData(
    String baseUrl, {
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.patch(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Map<String, dynamic>? headers,
  }) {
    return dio.delete(
      ApiConstants.baseUrl + endPoint,
      queryParameters: queryParameters,
      data: body,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}
