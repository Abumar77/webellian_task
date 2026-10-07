part of 'works_bloc.dart';

T _$identity<T>(T value) => value;

mixin _$WorksEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorksEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorksEvent()';
  }
}

class $WorksEventCopyWith<$Res> {
  $WorksEventCopyWith(WorksEvent _, $Res Function(WorksEvent) __);
}

extension WorksEventPatterns on WorksEvent {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WorksRequested value)? requested,
    TResult Function(MoreWorksRequested value)? moreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case WorksRequested() when requested != null:
        return requested(_that);
      case MoreWorksRequested() when moreRequested != null:
        return moreRequested(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WorksRequested value) requested,
    required TResult Function(MoreWorksRequested value) moreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case WorksRequested():
        return requested(_that);
      case MoreWorksRequested():
        return moreRequested(_that);
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WorksRequested value)? requested,
    TResult? Function(MoreWorksRequested value)? moreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case WorksRequested() when requested != null:
        return requested(_that);
      case MoreWorksRequested() when moreRequested != null:
        return moreRequested(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requested,
    TResult Function()? moreRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case WorksRequested() when requested != null:
        return requested();
      case MoreWorksRequested() when moreRequested != null:
        return moreRequested();
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requested,
    required TResult Function() moreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case WorksRequested():
        return requested();
      case MoreWorksRequested():
        return moreRequested();
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requested,
    TResult? Function()? moreRequested,
  }) {
    final _that = this;
    switch (_that) {
      case WorksRequested() when requested != null:
        return requested();
      case MoreWorksRequested() when moreRequested != null:
        return moreRequested();
      case _:
        return null;
    }
  }
}

class WorksRequested implements WorksEvent {
  const WorksRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WorksRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorksEvent.requested()';
  }
}

class MoreWorksRequested implements WorksEvent {
  const MoreWorksRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MoreWorksRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WorksEvent.moreRequested()';
  }
}

mixin _$WorksState {
  List<AuthorWork> get works;
  bool get loading;
  bool get loaded;
  bool get hasMore;
  int get nextOffset;
  int get total;
  String? get error;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorksStateCopyWith<WorksState> get copyWith =>
      _$WorksStateCopyWithImpl<WorksState>(this as WorksState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorksState &&
            const DeepCollectionEquality().equals(other.works, works) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loaded, loaded) || other.loaded == loaded) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(works),
    loading,
    loaded,
    hasMore,
    nextOffset,
    total,
    error,
  );

  @override
  String toString() {
    return 'WorksState(works: $works, loading: $loading, loaded: $loaded, hasMore: $hasMore, nextOffset: $nextOffset, total: $total, error: $error)';
  }
}

abstract mixin class $WorksStateCopyWith<$Res> {
  factory $WorksStateCopyWith(
    WorksState value,
    $Res Function(WorksState) _then,
  ) = _$WorksStateCopyWithImpl;
  @useResult
  $Res call({
    List<AuthorWork> works,
    bool loading,
    bool loaded,
    bool hasMore,
    int nextOffset,
    int total,
    String? error,
  });
}

class _$WorksStateCopyWithImpl<$Res> implements $WorksStateCopyWith<$Res> {
  _$WorksStateCopyWithImpl(this._self, this._then);

  final WorksState _self;
  final $Res Function(WorksState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? works = null,
    Object? loading = null,
    Object? loaded = null,
    Object? hasMore = null,
    Object? nextOffset = null,
    Object? total = null,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        works: null == works ? _self.works : works as List<AuthorWork>,
        loading: null == loading ? _self.loading : loading as bool,
        loaded: null == loaded ? _self.loaded : loaded as bool,
        hasMore: null == hasMore ? _self.hasMore : hasMore as bool,
        nextOffset: null == nextOffset ? _self.nextOffset : nextOffset as int,
        total: null == total ? _self.total : total as int,
        error: freezed == error ? _self.error : error as String?,
      ),
    );
  }
}

extension WorksStatePatterns on WorksState {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_WorksState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorksState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_WorksState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorksState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_WorksState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorksState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      List<AuthorWork> works,
      bool loading,
      bool loaded,
      bool hasMore,
      int nextOffset,
      int total,
      String? error,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _WorksState() when $default != null:
        return $default(
          _that.works,
          _that.loading,
          _that.loaded,
          _that.hasMore,
          _that.nextOffset,
          _that.total,
          _that.error,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      List<AuthorWork> works,
      bool loading,
      bool loaded,
      bool hasMore,
      int nextOffset,
      int total,
      String? error,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorksState():
        return $default(
          _that.works,
          _that.loading,
          _that.loaded,
          _that.hasMore,
          _that.nextOffset,
          _that.total,
          _that.error,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      List<AuthorWork> works,
      bool loading,
      bool loaded,
      bool hasMore,
      int nextOffset,
      int total,
      String? error,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _WorksState() when $default != null:
        return $default(
          _that.works,
          _that.loading,
          _that.loaded,
          _that.hasMore,
          _that.nextOffset,
          _that.total,
          _that.error,
        );
      case _:
        return null;
    }
  }
}

class _WorksState implements WorksState {
  const _WorksState({
    final List<AuthorWork> works = const [],
    this.loading = false,
    this.loaded = false,
    this.hasMore = false,
    this.nextOffset = 0,
    this.total = 0,
    this.error,
  }) : _works = works;

  final List<AuthorWork> _works;
  @override
  @JsonKey()
  List<AuthorWork> get works {
    if (_works is EqualUnmodifiableListView) return _works;

    return EqualUnmodifiableListView(_works);
  }

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool loaded;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final int nextOffset;
  @override
  @JsonKey()
  final int total;
  @override
  final String? error;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorksStateCopyWith<_WorksState> get copyWith =>
      __$WorksStateCopyWithImpl<_WorksState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorksState &&
            const DeepCollectionEquality().equals(other._works, _works) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loaded, loaded) || other.loaded == loaded) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_works),
    loading,
    loaded,
    hasMore,
    nextOffset,
    total,
    error,
  );

  @override
  String toString() {
    return 'WorksState(works: $works, loading: $loading, loaded: $loaded, hasMore: $hasMore, nextOffset: $nextOffset, total: $total, error: $error)';
  }
}

abstract mixin class _$WorksStateCopyWith<$Res>
    implements $WorksStateCopyWith<$Res> {
  factory _$WorksStateCopyWith(
    _WorksState value,
    $Res Function(_WorksState) _then,
  ) = __$WorksStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<AuthorWork> works,
    bool loading,
    bool loaded,
    bool hasMore,
    int nextOffset,
    int total,
    String? error,
  });
}

class __$WorksStateCopyWithImpl<$Res> implements _$WorksStateCopyWith<$Res> {
  __$WorksStateCopyWithImpl(this._self, this._then);

  final _WorksState _self;
  final $Res Function(_WorksState) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? works = null,
    Object? loading = null,
    Object? loaded = null,
    Object? hasMore = null,
    Object? nextOffset = null,
    Object? total = null,
    Object? error = freezed,
  }) {
    return _then(
      _WorksState(
        works: null == works ? _self._works : works as List<AuthorWork>,
        loading: null == loading ? _self.loading : loading as bool,
        loaded: null == loaded ? _self.loaded : loaded as bool,
        hasMore: null == hasMore ? _self.hasMore : hasMore as bool,
        nextOffset: null == nextOffset ? _self.nextOffset : nextOffset as int,
        total: null == total ? _self.total : total as int,
        error: freezed == error ? _self.error : error as String?,
      ),
    );
  }
}
