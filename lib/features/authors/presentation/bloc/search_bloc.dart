import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_failure.dart';
import '../../domain/author.dart';
import '../../domain/author_repository.dart';

sealed class SearchEvent {}

final class QueryChanged extends SearchEvent {
  QueryChanged(this.query);
  final String query;
}

final class SearchRetried extends SearchEvent {}

final class MoreAuthorsRequested extends SearchEvent {}

final class _SearchRequested extends SearchEvent {
  _SearchRequested(this.revision);
  final int revision;
}

enum SearchStatus { initial, loading, success, failure }

class SearchState extends Equatable {
  const SearchState({
    this.query = '',
    this.status = SearchStatus.initial,
    this.authors = const [],
    this.total = 0,
    this.nextOffset = 0,
    this.hasMore = false,
    this.loadingMore = false,
    this.error,
  });
  final String query;
  final SearchStatus status;
  final List<Author> authors;
  final int total;
  final int nextOffset;
  final bool hasMore;
  final bool loadingMore;
  final String? error;
  @override
  List<Object?> get props => [
    query,
    status,
    authors,
    total,
    nextOffset,
    hasMore,
    loadingMore,
    error,
  ];
}

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    this.searchAuthors, {
    this.debounce = const Duration(milliseconds: 400),
  }) : super(const SearchState()) {
    on<QueryChanged>(_queryChanged);
    on<_SearchRequested>((event, emit) => _search(event.revision, emit));
    on<SearchRetried>((event, emit) async {
      if (state.query.isEmpty) return;
      _timer?.cancel();
      await _search(++_revision, emit);
    });
    on<MoreAuthorsRequested>(_loadMore);
  }
  final SearchAuthors searchAuthors;
  final Duration debounce;
  Timer? _timer;
  int _revision = 0;

  void _queryChanged(QueryChanged event, Emitter<SearchState> emit) {
    final query = event.query.trim();
    if (query == state.query) return;
    _timer?.cancel();
    final revision = ++_revision;
    emit(
      SearchState(
        query: query,
        status: query.isEmpty ? SearchStatus.initial : SearchStatus.loading,
      ),
    );
    if (query.isNotEmpty) {
      _timer = Timer(debounce, () => add(_SearchRequested(revision)));
    }
  }

  Future<void> _search(int revision, Emitter<SearchState> emit) async {
    if (revision != _revision) return;
    final query = state.query;
    emit(SearchState(query: query, status: SearchStatus.loading));
    try {
      final page = await searchAuthors(query);
      if (revision != _revision || emit.isDone) return;
      emit(
        SearchState(
          query: query,
          status: SearchStatus.success,
          authors: page.items,
          total: page.total,
          nextOffset: page.nextOffset,
          hasMore: page.hasMore,
        ),
      );
    } catch (error) {
      if (revision != _revision || emit.isDone) return;
      emit(
        SearchState(
          query: query,
          status: SearchStatus.failure,
          error: _message(error),
        ),
      );
    }
  }

  Future<void> _loadMore(
    MoreAuthorsRequested event,
    Emitter<SearchState> emit,
  ) async {
    final previous = state;
    if (previous.status != SearchStatus.success ||
        !previous.hasMore ||
        previous.loadingMore) {
      return;
    }
    final revision = _revision;
    emit(_copy(previous, loadingMore: true));
    try {
      final page = await searchAuthors(
        previous.query,
        offset: previous.nextOffset,
      );
      if (revision != _revision || emit.isDone) return;
      final merged = {
        for (final author in [...previous.authors, ...page.items])
          author.id: author,
      };
      emit(
        SearchState(
          query: previous.query,
          status: SearchStatus.success,
          authors: List.unmodifiable(merged.values),
          total: page.total,
          nextOffset: page.nextOffset,
          hasMore: page.hasMore,
        ),
      );
    } catch (error) {
      if (revision != _revision || emit.isDone) return;
      emit(_copy(previous, error: _message(error)));
    }
  }

  SearchState _copy(
    SearchState old, {
    bool loadingMore = false,
    String? error,
  }) => SearchState(
    query: old.query,
    status: old.status,
    authors: old.authors,
    total: old.total,
    nextOffset: old.nextOffset,
    hasMore: old.hasMore,
    loadingMore: loadingMore,
    error: error,
  );
  String _message(Object error) => error is AppFailure
      ? error.message
      : 'Something went wrong. Please retry.';

  @override
  Future<void> close() {
    _timer?.cancel();
    ++_revision;
    return super.close();
  }
}
