import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:alice_dio/alice_dio_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get_it/get_it.dart';
import '../../features/authors/data/open_library_api.dart';
import '../../features/authors/data/open_library_repository.dart';
import '../../features/authors/domain/author_repository.dart';
import '../../features/authors/presentation/bloc/search/search_bloc.dart';
import '../../features/authors/presentation/bloc/works/works_bloc.dart';
import '../network/dio_client.dart';
import '../network/network_logging.dart';

final getIt = GetIt.instance;

void configureDependencies({GetIt? container, AuthorRepository? repository}) {
  final locator = container ?? getIt;
  if (kDebugMode) {
    locator.registerLazySingleton<Alice>(
      () => Alice(
        configuration: AliceConfiguration(
          showNotification: false,
          showInspectorOnShake: false,
          storage: AliceMemoryStorage(maxCallsCount: 100),
        ),
      ),
    );
    locator.registerLazySingleton<AliceDioAdapter>(() {
      final adapter = AppAliceDioAdapter();
      locator<Alice>().addAdapter(adapter);
      return adapter;
    });
  }
  locator.registerLazySingleton<Dio>(() {
    final dio = DioClient.createDio();
    if (kDebugMode) {
      dio.interceptors.add(locator<AliceDioAdapter>());
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: NetworkLogging.fullBodies,
          error: true,
          compact: true,
          logPrint: (message) => debugPrint(message.toString()),
        ),
      );
    }
    return dio;
  }, dispose: (dio) => dio.close(force: true));
  locator.registerLazySingleton<DioClient>(() => DioClient(locator<Dio>()));
  locator.registerLazySingleton<OpenLibraryApi>(
    () => OpenLibraryApi(locator<DioClient>()),
  );
  locator.registerLazySingleton<AuthorRepository>(
    () => repository ?? OpenLibraryRepository(locator<OpenLibraryApi>()),
  );
  locator.registerLazySingleton<SearchAuthors>(
    () => SearchAuthors(locator<AuthorRepository>()),
  );
  locator.registerLazySingleton<GetAuthorWorks>(
    () => GetAuthorWorks(locator<AuthorRepository>()),
  );

  locator.registerFactory<SearchBloc>(
    () => SearchBloc(locator<SearchAuthors>()),
  );
  locator.registerFactoryParam<WorksBloc, String, void>(
    (authorId, _) => WorksBloc(locator<GetAuthorWorks>(), authorId),
  );
}
