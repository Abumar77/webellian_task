part of 'search_bloc.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  const factory SearchEvent.queryChanged(String query) = QueryChanged;
  const factory SearchEvent.retried() = SearchRetried;
  const factory SearchEvent.moreAuthorsRequested() = MoreAuthorsRequested;
  const factory SearchEvent.requested(int revision) = _SearchRequested;
}
