part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure }

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SearchStatus.initial) SearchStatus status,
    @Default([]) List<Author> authors,
    @Default(0) int total,
    @Default(0) int nextOffset,
    @Default(false) bool hasMore,
    @Default(false) bool loadingMore,
    String? error,
  }) = _SearchState;
}
