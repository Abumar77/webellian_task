part of 'works_bloc.dart';

class WorksState extends Equatable {
  const WorksState({
    this.works = const [],
    this.loading = false,
    this.loaded = false,
    this.hasMore = false,
    this.nextOffset = 0,
    this.total = 0,
    this.error,
  });
  final List<AuthorWork> works;
  final bool loading;
  final bool loaded;
  final bool hasMore;
  final int nextOffset;
  final int total;
  final String? error;
  @override
  List<Object?> get props => [
    works,
    loading,
    loaded,
    hasMore,
    nextOffset,
    total,
    error,
  ];
}
