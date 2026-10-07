part of 'works_bloc.dart';

@freezed
abstract class WorksState with _$WorksState {
  const factory WorksState({
    @Default([]) List<AuthorWork> works,
    @Default(false) bool loading,
    @Default(false) bool loaded,
    @Default(false) bool hasMore,
    @Default(0) int nextOffset,
    @Default(0) int total,
    String? error,
  }) = _WorksState;
}
