part of 'search_bloc.dart';

T _$identity<T>(T value) => value;

mixin _$SearchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent()';
  }
}

class $SearchEventCopyWith<$Res> {
  $SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}

extension SearchEventPatterns on SearchEvent {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchRetried value)? retried,
    TResult Function(MoreAuthorsRequested value)? moreAuthorsRequested,
    TResult Function(_SearchRequested value)? requested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QueryChanged() when queryChanged != null:
        return queryChanged(_that);
      case SearchRetried() when retried != null:
        return retried(_that);
      case MoreAuthorsRequested() when moreAuthorsRequested != null:
        return moreAuthorsRequested(_that);
      case _SearchRequested() when requested != null:
        return requested(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchRetried value) retried,
    required TResult Function(MoreAuthorsRequested value) moreAuthorsRequested,
    required TResult Function(_SearchRequested value) requested,
  }) {
    final _that = this;
    switch (_that) {
      case QueryChanged():
        return queryChanged(_that);
      case SearchRetried():
        return retried(_that);
      case MoreAuthorsRequested():
        return moreAuthorsRequested(_that);
      case _SearchRequested():
        return requested(_that);
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(SearchRetried value)? retried,
    TResult? Function(MoreAuthorsRequested value)? moreAuthorsRequested,
    TResult? Function(_SearchRequested value)? requested,
  }) {
    final _that = this;
    switch (_that) {
      case QueryChanged() when queryChanged != null:
        return queryChanged(_that);
      case SearchRetried() when retried != null:
        return retried(_that);
      case MoreAuthorsRequested() when moreAuthorsRequested != null:
        return moreAuthorsRequested(_that);
      case _SearchRequested() when requested != null:
        return requested(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function()? retried,
    TResult Function()? moreAuthorsRequested,
    TResult Function(int revision)? requested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case QueryChanged() when queryChanged != null:
        return queryChanged(_that.query);
      case SearchRetried() when retried != null:
        return retried();
      case MoreAuthorsRequested() when moreAuthorsRequested != null:
        return moreAuthorsRequested();
      case _SearchRequested() when requested != null:
        return requested(_that.revision);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function() retried,
    required TResult Function() moreAuthorsRequested,
    required TResult Function(int revision) requested,
  }) {
    final _that = this;
    switch (_that) {
      case QueryChanged():
        return queryChanged(_that.query);
      case SearchRetried():
        return retried();
      case MoreAuthorsRequested():
        return moreAuthorsRequested();
      case _SearchRequested():
        return requested(_that.revision);
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function()? retried,
    TResult? Function()? moreAuthorsRequested,
    TResult? Function(int revision)? requested,
  }) {
    final _that = this;
    switch (_that) {
      case QueryChanged() when queryChanged != null:
        return queryChanged(_that.query);
      case SearchRetried() when retried != null:
        return retried();
      case MoreAuthorsRequested() when moreAuthorsRequested != null:
        return moreAuthorsRequested();
      case _SearchRequested() when requested != null:
        return requested(_that.revision);
      case _:
        return null;
    }
  }
}

class QueryChanged implements SearchEvent {
  const QueryChanged(this.query);

  final String query;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryChangedCopyWith<QueryChanged> get copyWith =>
      _$QueryChangedCopyWithImpl<QueryChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryChanged &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'SearchEvent.queryChanged(query: $query)';
  }
}

abstract mixin class $QueryChangedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory $QueryChangedCopyWith(
    QueryChanged value,
    $Res Function(QueryChanged) _then,
  ) = _$QueryChangedCopyWithImpl;
  @useResult
  $Res call({String query});
}

class _$QueryChangedCopyWithImpl<$Res> implements $QueryChangedCopyWith<$Res> {
  _$QueryChangedCopyWithImpl(this._self, this._then);

  final QueryChanged _self;
  final $Res Function(QueryChanged) _then;

  @pragma('vm:prefer-inline')
  $Res call({Object? query = null}) {
    return _then(QueryChanged(null == query ? _self.query : query as String));
  }
}

class SearchRetried implements SearchEvent {
  const SearchRetried();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SearchRetried);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent.retried()';
  }
}

class MoreAuthorsRequested implements SearchEvent {
  const MoreAuthorsRequested();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MoreAuthorsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SearchEvent.moreAuthorsRequested()';
  }
}

class _SearchRequested implements SearchEvent {
  const _SearchRequested(this.revision);

  final int revision;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchRequestedCopyWith<_SearchRequested> get copyWith =>
      __$SearchRequestedCopyWithImpl<_SearchRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRequested &&
            (identical(other.revision, revision) ||
                other.revision == revision));
  }

  @override
  int get hashCode => Object.hash(runtimeType, revision);

  @override
  String toString() {
    return 'SearchEvent.requested(revision: $revision)';
  }
}

abstract mixin class _$SearchRequestedCopyWith<$Res>
    implements $SearchEventCopyWith<$Res> {
  factory _$SearchRequestedCopyWith(
    _SearchRequested value,
    $Res Function(_SearchRequested) _then,
  ) = __$SearchRequestedCopyWithImpl;
  @useResult
  $Res call({int revision});
}

class __$SearchRequestedCopyWithImpl<$Res>
    implements _$SearchRequestedCopyWith<$Res> {
  __$SearchRequestedCopyWithImpl(this._self, this._then);

  final _SearchRequested _self;
  final $Res Function(_SearchRequested) _then;

  @pragma('vm:prefer-inline')
  $Res call({Object? revision = null}) {
    return _then(
      _SearchRequested(null == revision ? _self.revision : revision as int),
    );
  }
}

mixin _$SearchState {
  String get query;
  SearchStatus get status;
  List<Author> get authors;
  int get total;
  int get nextOffset;
  bool get hasMore;
  bool get loadingMore;
  String? get error;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    status,
    const DeepCollectionEquality().hash(authors),
    total,
    nextOffset,
    hasMore,
    loadingMore,
    error,
  );

  @override
  String toString() {
    return 'SearchState(query: $query, status: $status, authors: $authors, total: $total, nextOffset: $nextOffset, hasMore: $hasMore, loadingMore: $loadingMore, error: $error)';
  }
}

abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) _then,
  ) = _$SearchStateCopyWithImpl;
  @useResult
  $Res call({
    String query,
    SearchStatus status,
    List<Author> authors,
    int total,
    int nextOffset,
    bool hasMore,
    bool loadingMore,
    String? error,
  });
}

class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? status = null,
    Object? authors = null,
    Object? total = null,
    Object? nextOffset = null,
    Object? hasMore = null,
    Object? loadingMore = null,
    Object? error = freezed,
  }) {
    return _then(
      _self.copyWith(
        query: null == query ? _self.query : query as String,
        status: null == status ? _self.status : status as SearchStatus,
        authors: null == authors ? _self.authors : authors as List<Author>,
        total: null == total ? _self.total : total as int,
        nextOffset: null == nextOffset ? _self.nextOffset : nextOffset as int,
        hasMore: null == hasMore ? _self.hasMore : hasMore as bool,
        loadingMore: null == loadingMore
            ? _self.loadingMore
            : loadingMore as bool,
        error: freezed == error ? _self.error : error as String?,
      ),
    );
  }
}

extension SearchStatePatterns on SearchState {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String query,
      SearchStatus status,
      List<Author> authors,
      int total,
      int nextOffset,
      bool hasMore,
      bool loadingMore,
      String? error,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
          _that.query,
          _that.status,
          _that.authors,
          _that.total,
          _that.nextOffset,
          _that.hasMore,
          _that.loadingMore,
          _that.error,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String query,
      SearchStatus status,
      List<Author> authors,
      int total,
      int nextOffset,
      bool hasMore,
      bool loadingMore,
      String? error,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(
          _that.query,
          _that.status,
          _that.authors,
          _that.total,
          _that.nextOffset,
          _that.hasMore,
          _that.loadingMore,
          _that.error,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String query,
      SearchStatus status,
      List<Author> authors,
      int total,
      int nextOffset,
      bool hasMore,
      bool loadingMore,
      String? error,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
          _that.query,
          _that.status,
          _that.authors,
          _that.total,
          _that.nextOffset,
          _that.hasMore,
          _that.loadingMore,
          _that.error,
        );
      case _:
        return null;
    }
  }
}

class _SearchState implements SearchState {
  const _SearchState({
    this.query = '',
    this.status = SearchStatus.initial,
    final List<Author> authors = const [],
    this.total = 0,
    this.nextOffset = 0,
    this.hasMore = false,
    this.loadingMore = false,
    this.error,
  }) : _authors = authors;

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final SearchStatus status;
  final List<Author> _authors;
  @override
  @JsonKey()
  List<Author> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;

    return EqualUnmodifiableListView(_authors);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int nextOffset;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  @JsonKey()
  final bool loadingMore;
  @override
  final String? error;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.nextOffset, nextOffset) ||
                other.nextOffset == nextOffset) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    status,
    const DeepCollectionEquality().hash(_authors),
    total,
    nextOffset,
    hasMore,
    loadingMore,
    error,
  );

  @override
  String toString() {
    return 'SearchState(query: $query, status: $status, authors: $authors, total: $total, nextOffset: $nextOffset, hasMore: $hasMore, loadingMore: $loadingMore, error: $error)';
  }
}

abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
    _SearchState value,
    $Res Function(_SearchState) _then,
  ) = __$SearchStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    String query,
    SearchStatus status,
    List<Author> authors,
    int total,
    int nextOffset,
    bool hasMore,
    bool loadingMore,
    String? error,
  });
}

class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
    Object? status = null,
    Object? authors = null,
    Object? total = null,
    Object? nextOffset = null,
    Object? hasMore = null,
    Object? loadingMore = null,
    Object? error = freezed,
  }) {
    return _then(
      _SearchState(
        query: null == query ? _self.query : query as String,
        status: null == status ? _self.status : status as SearchStatus,
        authors: null == authors ? _self._authors : authors as List<Author>,
        total: null == total ? _self.total : total as int,
        nextOffset: null == nextOffset ? _self.nextOffset : nextOffset as int,
        hasMore: null == hasMore ? _self.hasMore : hasMore as bool,
        loadingMore: null == loadingMore
            ? _self.loadingMore
            : loadingMore as bool,
        error: freezed == error ? _self.error : error as String?,
      ),
    );
  }
}
