import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:webellian_task/core/di/injection.dart';
import 'package:webellian_task/core/network/dio_client.dart';
import 'package:webellian_task/features/authors/domain/author_repository.dart';
import 'package:webellian_task/features/authors/presentation/bloc/search/search_bloc.dart';
import 'package:webellian_task/features/authors/presentation/bloc/works/works_bloc.dart';

class TrackingAdapter implements HttpClientAdapter {
  bool closed = false;
  @override
  void close({bool force = false}) => closed = true;
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) => throw UnimplementedError('No network requests expected');
}

void main() {
  test(
    'container shares services and creates independent widget-owned Blocs',
    () async {
      final container = GetIt.asNewInstance();
      configureDependencies(container: container);
      addTearDown(container.reset);
      expect(
        identical(container<AuthorRepository>(), container<AuthorRepository>()),
        isTrue,
      );
      expect(identical(container<DioClient>().dio, container<Dio>()), isTrue);
      final first = container<SearchBloc>();
      final second = container<SearchBloc>();
      addTearDown(first.close);
      addTearDown(second.close);
      expect(identical(first, second), isFalse);
      await first.close();
      expect(second.isClosed, isFalse);
      final works = container<WorksBloc>(param1: 'OL1A');
      addTearDown(works.close);
      expect(works.authorId, 'OL1A');
    },
  );

  test('reset disposes the shared Dio transport', () async {
    final container = GetIt.asNewInstance();
    configureDependencies(container: container);
    final adapter = TrackingAdapter();
    container<Dio>().httpClientAdapter = adapter;
    await container.reset();
    expect(adapter.closed, isTrue);
    expect(container.isRegistered<Dio>(), isFalse);
  });
}
