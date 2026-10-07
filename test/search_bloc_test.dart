import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:webellian_task/core/app_failure.dart';
import 'package:webellian_task/features/authors/domain/author.dart';
import 'package:webellian_task/features/authors/domain/author_repository.dart';
import 'package:webellian_task/features/authors/presentation/bloc/search_bloc.dart';
import 'package:webellian_task/features/authors/presentation/bloc/works_bloc.dart';

class ControlledRepository implements AuthorRepository {
  final queries = <String>[];
  final requests = <Completer<PageResult<Author>>>[];
  final offsets = <int>[];
  @override
  Future<PageResult<Author>> search(String query, {int offset = 0}) {
    queries.add(query);
    offsets.add(offset);
    final request = Completer<PageResult<Author>>();
    requests.add(request);
    return request.future;
  }

  @override
  Future<PageResult<AuthorWork>> works(String id, {int offset = 0}) async =>
      PageResult(
        items: [AuthorWork(id: '$offset', title: 'Work $offset')],
        total: 2,
        offset: offset,
      );
}

Future<void> tick([int milliseconds = 10]) =>
    Future<void>.delayed(Duration(milliseconds: milliseconds));
PageResult<Author> page(String name, {int offset = 0, int total = 1}) =>
    PageResult(
      items: [Author(id: name, name: name)],
      total: total,
      offset: offset,
    );

void main() {
  late ControlledRepository repository;
  late SearchBloc bloc;
  setUp(() {
    repository = ControlledRepository();
    bloc = SearchBloc(
      SearchAuthors(repository),
      debounce: const Duration(milliseconds: 30),
    );
  });
  tearDown(() => bloc.close());

  test('rapid typing issues only the last query', () async {
    bloc.add(QueryChanged('J'));
    await tick();
    bloc.add(QueryChanged('Jane'));
    await tick(50);
    expect(repository.queries, ['Jane']);
    repository.requests.single.complete(page('Jane'));
    await tick();
    expect(bloc.state.authors.single.name, 'Jane');
  });

  test(
    'a changed query invalidates the previous request immediately',
    () async {
      bloc.add(QueryChanged('old'));
      await tick(50);
      bloc.add(QueryChanged('new'));
      await tick();
      repository.requests[0].complete(page('old'));
      await tick();
      expect(bloc.state.authors, isEmpty);
      await tick(40);
      repository.requests[1].complete(page('new'));
      await tick();
      expect(bloc.state.authors.single.name, 'new');
    },
  );

  test('clearing invalidates in-flight results', () async {
    bloc.add(QueryChanged('Jane'));
    await tick(50);
    bloc.add(QueryChanged('  '));
    await tick();
    repository.requests.single.complete(page('Jane'));
    await tick();
    expect(bloc.state.status, SearchStatus.initial);
  });

  test(
    'failure can be retried and pagination preserves existing records',
    () async {
      bloc.add(QueryChanged('Jane'));
      await tick(50);
      repository.requests[0].completeError(const AppFailure('Offline'));
      await tick();
      expect(bloc.state.error, 'Offline');
      bloc.add(SearchRetried());
      await tick();
      repository.requests[1].complete(page('one', total: 2));
      await tick();
      bloc.add(MoreAuthorsRequested());
      bloc.add(MoreAuthorsRequested());
      await tick();
      expect(repository.offsets, [0, 0, 1]);
      repository.requests[2].complete(page('two', offset: 1, total: 2));
      await tick();
      expect(bloc.state.authors.map((a) => a.name), ['one', 'two']);
      expect(bloc.state.hasMore, isFalse);
    },
  );

  test('works load successive pages without duplicate requests', () async {
    final works = WorksBloc(GetAuthorWorks(repository), 'OL1A');
    addTearDown(works.close);
    works.add(WorksRequested());
    await tick();
    works.add(MoreWorksRequested());
    await tick();
    expect(works.state.works.map((w) => w.title), ['Work 0', 'Work 1']);
    expect(works.state.hasMore, isFalse);
  });
}
