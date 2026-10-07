part of 'search_bloc.dart';

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
