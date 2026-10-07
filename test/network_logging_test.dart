import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:webellian_task/core/di/injection.dart';

class RecordingResponseHandler extends ResponseInterceptorHandler {
  Response<dynamic>? forwarded;

  @override
  void next(Response<dynamic> response) {
    forwarded = response;
    super.next(response);
  }
}

void main() {
  test(
    'Alice records a bounded summary without changing the application response',
    () async {
      final container = GetIt.asNewInstance();
      configureDependencies(container: container);
      addTearDown(container.reset);
      final adapter = container<AliceDioAdapter>();
      final options = RequestOptions(
        path: '/search/authors.json',
        baseUrl: 'https://openlibrary.org',
      );
      adapter.onRequest(options, RequestInterceptorHandler());
      final payload = {
        'numFound': 100,
        'docs': List.generate(
          20,
          (i) => {'name': 'Author $i', 'description': 'x' * 10000},
        ),
      };
      final response = Response<dynamic>(
        requestOptions: options,
        data: payload,
        statusCode: 200,
      );
      final handler = RecordingResponseHandler();
      adapter.onResponse(response, handler);
      expect(identical(handler.forwarded, response), isTrue);
      expect(identical(response.data, payload), isTrue);
      final recorded = adapter.aliceCore.configuration.aliceStorage
          .getCalls()
          .single;
      expect(recorded.response!.body, {
        'body': 'Full body logging disabled',
        'numFound': 100,
        'docsCount': 20,
      });
    },
  );
}
