import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';

abstract final class NetworkLogging {
  static const fullBodies = bool.fromEnvironment('HTTP_BODY_LOGS');
}

class AppAliceDioAdapter extends AliceDioAdapter {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    super.onResponse(_snapshot(response), ResponseInterceptorHandler());
    handler.next(response);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    super.onError(
      DioException(
        requestOptions: error.requestOptions,
        response: error.response == null ? null : _snapshot(error.response!),
        type: error.type,
        error: error.error,
        message: error.message,
        stackTrace: error.stackTrace,
      ),
      ErrorInterceptorHandler(),
    );
    handler.next(error);
  }

  Response<dynamic> _snapshot(Response<dynamic> response) {
    if (NetworkLogging.fullBodies) return response;
    final data = response.data;
    final summary = <String, dynamic>{'body': 'Full body logging disabled'};
    if (data is Map) {
      for (final key in ['numFound', 'size']) {
        final value = data[key];
        if (value is num) summary[key] = value;
      }
      for (final key in ['docs', 'entries']) {
        final value = data[key];
        if (value is List) summary['${key}Count'] = value.length;
      }
    }
    return Response<dynamic>(
      requestOptions: response.requestOptions,
      data: summary,
      headers: response.headers,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
    );
  }
}
