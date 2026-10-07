import 'package:dio/dio.dart';
import '../app_failure.dart';
import 'api_endpoints.dart';

class DioClient {
  const DioClient(this.dio);
  final Dio dio;

  static Dio createDio() => Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> getJson(
    String path,
    Map<String, dynamic> parameters,
  ) async {
    try {
      final response = await dio.get<Object?>(
        path,
        queryParameters: parameters,
      );
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw const AppFailure(
          'Open Library returned an unexpected response. Please retry.',
        );
      }
      return data;
    } on DioException catch (error) {
      throw AppFailure(switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.sendTimeout => 'The request timed out. Please retry.',
        DioExceptionType.connectionError =>
          'Unable to connect. Check your internet connection.',
        _ => 'Open Library is unavailable. Please try again.',
      });
    }
  }
}
