import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_failure.dart';
import '../../../domain/author.dart';
import '../../../domain/author_repository.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

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
    emit(previous.copyWith(loadingMore: true, error: null));
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
      emit(previous.copyWith(loadingMore: false, error: _message(error)));
    }
  }

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
