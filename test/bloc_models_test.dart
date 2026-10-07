import 'package:flutter_test/flutter_test.dart';
import 'package:webellian_task/features/authors/domain/author.dart';
import 'package:webellian_task/features/authors/presentation/bloc/search/search_bloc.dart';
import 'package:webellian_task/features/authors/presentation/bloc/works/works_bloc.dart';

void main() {
  test('search state copies clear errors and preserve immutable results', () {
    const state = SearchState(
      authors: [Author(id: 'OL1A', name: 'Jane')],
      error: 'Offline',
    );
    final copy = state.copyWith(loadingMore: true, error: null);
    expect(copy.error, isNull);
    expect(state.error, 'Offline');
    expect(copy.authors, state.authors);
    expect(() => copy.authors.clear(), throwsUnsupportedError);
  });

  test('works state and union events compare by value', () {
    expect(
      const SearchEvent.queryChanged('Jane'),
      const SearchEvent.queryChanged('Jane'),
    );
    expect(
      const SearchEvent.retried(),
      isNot(const SearchEvent.moreAuthorsRequested()),
    );
    expect(const WorksEvent.requested(), const WorksEvent.requested());
    expect(
      const WorksState(error: 'Offline').copyWith(error: null),
      const WorksState(),
    );
  });
}
