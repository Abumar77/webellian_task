part of 'search_bloc.dart';

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
