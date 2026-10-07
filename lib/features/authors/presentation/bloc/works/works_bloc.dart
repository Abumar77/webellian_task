import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_failure.dart';
import '../../../domain/author.dart';
import '../../../domain/author_repository.dart';

part 'works_event.dart';
part 'works_state.dart';
part 'works_bloc.freezed.dart';

class WorksBloc extends Bloc<WorksEvent, WorksState> {
  WorksBloc(this.getWorks, this.authorId) : super(const WorksState()) {
    on<WorksRequested>((event, emit) => _load(emit, more: false));
    on<MoreWorksRequested>((event, emit) => _load(emit, more: true));
  }
  final GetAuthorWorks getWorks;
  final String authorId;

  Future<void> _load(Emitter<WorksState> emit, {required bool more}) async {
    final previous = state;
    if (previous.loading || (more && !previous.hasMore)) return;
    emit(
      WorksState(
        works: previous.works,
        loaded: previous.loaded,
        loading: true,
        hasMore: previous.hasMore,
        nextOffset: previous.nextOffset,
        total: previous.total,
      ),
    );
    try {
      final page = await getWorks(
        authorId,
        offset: more ? previous.nextOffset : 0,
      );
      if (emit.isDone) return;
      final merged = {
        for (final work in [
          ...(more ? previous.works : <AuthorWork>[]),
          ...page.items,
        ])
          work.id: work,
      };
      emit(
        WorksState(
          works: List.unmodifiable(merged.values),
          loaded: true,
          hasMore: page.hasMore,
          nextOffset: page.nextOffset,
          total: page.total,
        ),
      );
    } catch (error) {
      if (emit.isDone) return;
      emit(
        WorksState(
          works: previous.works,
          loaded: previous.loaded,
          hasMore: previous.hasMore,
          nextOffset: previous.nextOffset,
          total: previous.total,
          error: error is AppFailure
              ? error.message
              : 'Something went wrong. Please retry.',
        ),
      );
    }
  }
}
