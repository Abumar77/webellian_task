import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/authors/data/open_library_api.dart';
import '../../features/authors/data/open_library_repository.dart';
import '../../features/authors/domain/author_repository.dart';
import '../../features/authors/presentation/bloc/search/search_bloc.dart';
import '../../features/authors/presentation/bloc/works/works_bloc.dart';
import '../network/dio_client.dart';

final getIt = GetIt.instance;

void configureDependencies({GetIt? container, AuthorRepository? repository}) {
  final locator = container ?? getIt;
  locator.registerLazySingleton<Dio>(
    DioClient.createDio,
    dispose: (dio) => dio.close(force: true),
  );
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
