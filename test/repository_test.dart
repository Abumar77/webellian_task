import 'dart:typed_data';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:webellian_task/core/network/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webellian_task/core/app_failure.dart';
import 'package:webellian_task/features/authors/data/open_library_api.dart';
import 'package:webellian_task/features/authors/data/open_library_repository.dart';

class StubAdapter implements HttpClientAdapter {
  StubAdapter(this.response);
  final Object response;
  RequestOptions? request;
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? stream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    return ResponseBody.fromString(
      jsonEncode(response),
      200,
      headers: {
        Headers.contentTypeHeader: ['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  test(
    'maps authors, normalizes identifiers and handles missing metadata',
    () async {
      final adapter = StubAdapter({
        'numFound': 1,
        'docs': [
          {
            'key': '/authors/OL1A',
            'name': 'Jane',
            'birth_date': '  ',
            'top_work': 'Book',
          },
        ],
      });
      final dio = Dio()..httpClientAdapter = adapter;
      addTearDown(dio.close);
      final repository = OpenLibraryRepository(OpenLibraryApi(DioClient(dio)));
      final page = await repository.search('Jane & John', offset: 20);
      expect(page.items.single.id, 'OL1A');
      expect(page.items.single.birthDate, isNull);
      expect(page.items.single.deathDate, isNull);
      expect(page.items.single.topWork, 'Book');
      expect(adapter.request!.queryParameters, {
        'q': 'Jane & John',
        'limit': 20,
        'offset': 20,
      });
    },
  );

  test('works use author ID and server count for pagination', () async {
    final adapter = StubAdapter({
      'size': 2,
      'entries': [
        {'key': '/works/OL1W', 'title': 'Book'},
      ],
    });
    final dio = Dio()..httpClientAdapter = adapter;
    addTearDown(dio.close);
    final page = await OpenLibraryRepository(
      OpenLibraryApi(DioClient(dio)),
    ).works('OL1A');
    expect(adapter.request!.path, '/authors/OL1A/works.json');
    expect(page.hasMore, isTrue);
    expect(page.nextOffset, 1);
    expect(page.items.single.firstPublishDate, isNull);
  });

  test('malformed records produce a typed failure', () async {
    final dio = Dio()
      ..httpClientAdapter = StubAdapter({
        'numFound': 1,
        'docs': [
          {'name': 'No key'},
        ],
      });
    addTearDown(dio.close);
    expect(
      OpenLibraryRepository(OpenLibraryApi(DioClient(dio))).search('Jane'),
      throwsA(isA<AppFailure>()),
    );
  });
}
