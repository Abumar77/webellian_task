import 'package:dio/dio.dart';
import '../../../core/app_failure.dart';

class OpenLibraryApi {
  OpenLibraryApi(this.dio);
  final Dio dio;
  static const pageSize = 20;

  Future<Map<String, dynamic>> search(String query, int offset) => _get(
    '/search/authors.json',
    {'q': query, 'limit': pageSize, 'offset': offset},
  );

  Future<Map<String, dynamic>> works(String id, int offset) => _get(
    '/authors/${Uri.encodeComponent(id)}/works.json',
    {'limit': pageSize, 'offset': offset},
  );

  Future<Map<String, dynamic>> _get(
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
