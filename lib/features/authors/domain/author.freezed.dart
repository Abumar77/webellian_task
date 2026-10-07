part of 'author.dart';

T _$identity<T>(T value) => value;

mixin _$Author {
  String get id;
  String get name;
  String? get birthDate;
  String? get deathDate;
  String? get topWork;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<Author> get copyWith =>
      _$AuthorCopyWithImpl<Author>(this as Author, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Author &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.topWork, topWork) || other.topWork == topWork));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, birthDate, deathDate, topWork);

  @override
  String toString() {
    return 'Author(id: $id, name: $name, birthDate: $birthDate, deathDate: $deathDate, topWork: $topWork)';
  }
}

abstract mixin class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) _then) =
      _$AuthorCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String name,
    String? birthDate,
    String? deathDate,
    String? topWork,
  });
}

class _$AuthorCopyWithImpl<$Res> implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._self, this._then);

  final Author _self;
  final $Res Function(Author) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? birthDate = freezed,
    Object? deathDate = freezed,
    Object? topWork = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id ? _self.id : id as String,
        name: null == name ? _self.name : name as String,
        birthDate: freezed == birthDate
            ? _self.birthDate
            : birthDate as String?,
        deathDate: freezed == deathDate
            ? _self.deathDate
            : deathDate as String?,
        topWork: freezed == topWork ? _self.topWork : topWork as String?,
      ),
    );
  }
}

extension AuthorPatterns on Author {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Author value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Author() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Author value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Author():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Author value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Author() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String? birthDate,
      String? deathDate,
      String? topWork,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Author() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.birthDate,
          _that.deathDate,
          _that.topWork,
        );
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String id,
      String name,
      String? birthDate,
      String? deathDate,
      String? topWork,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Author():
        return $default(
          _that.id,
          _that.name,
          _that.birthDate,
          _that.deathDate,
          _that.topWork,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String id,
      String name,
      String? birthDate,
      String? deathDate,
      String? topWork,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Author() when $default != null:
        return $default(
          _that.id,
          _that.name,
          _that.birthDate,
          _that.deathDate,
          _that.topWork,
        );
      case _:
        return null;
    }
  }
}

class _Author implements Author {
  const _Author({
    required this.id,
    required this.name,
    this.birthDate,
    this.deathDate,
    this.topWork,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String? birthDate;
  @override
  final String? deathDate;
  @override
  final String? topWork;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorCopyWith<_Author> get copyWith =>
      __$AuthorCopyWithImpl<_Author>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Author &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.topWork, topWork) || other.topWork == topWork));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, birthDate, deathDate, topWork);

  @override
  String toString() {
    return 'Author(id: $id, name: $name, birthDate: $birthDate, deathDate: $deathDate, topWork: $topWork)';
  }
}

abstract mixin class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) _then) =
      __$AuthorCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? birthDate,
    String? deathDate,
    String? topWork,
  });
}

class __$AuthorCopyWithImpl<$Res> implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(this._self, this._then);

  final _Author _self;
  final $Res Function(_Author) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? birthDate = freezed,
    Object? deathDate = freezed,
    Object? topWork = freezed,
  }) {
    return _then(
      _Author(
        id: null == id ? _self.id : id as String,
        name: null == name ? _self.name : name as String,
        birthDate: freezed == birthDate
            ? _self.birthDate
            : birthDate as String?,
        deathDate: freezed == deathDate
            ? _self.deathDate
            : deathDate as String?,
        topWork: freezed == topWork ? _self.topWork : topWork as String?,
      ),
    );
  }
}

mixin _$AuthorWork {
  String get id;
  String get title;
  String? get firstPublishDate;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorWorkCopyWith<AuthorWork> get copyWith =>
      _$AuthorWorkCopyWithImpl<AuthorWork>(this as AuthorWork, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorWork &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPublishDate, firstPublishDate) ||
                other.firstPublishDate == firstPublishDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, firstPublishDate);

  @override
  String toString() {
    return 'AuthorWork(id: $id, title: $title, firstPublishDate: $firstPublishDate)';
  }
}

abstract mixin class $AuthorWorkCopyWith<$Res> {
  factory $AuthorWorkCopyWith(
    AuthorWork value,
    $Res Function(AuthorWork) _then,
  ) = _$AuthorWorkCopyWithImpl;
  @useResult
  $Res call({String id, String title, String? firstPublishDate});
}

class _$AuthorWorkCopyWithImpl<$Res> implements $AuthorWorkCopyWith<$Res> {
  _$AuthorWorkCopyWithImpl(this._self, this._then);

  final AuthorWork _self;
  final $Res Function(AuthorWork) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? firstPublishDate = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id ? _self.id : id as String,
        title: null == title ? _self.title : title as String,
        firstPublishDate: freezed == firstPublishDate
            ? _self.firstPublishDate
            : firstPublishDate as String?,
      ),
    );
  }
}

extension AuthorWorkPatterns on AuthorWork {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthorWork value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorWork() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthorWork value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWork():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthorWork value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWork() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title, String? firstPublishDate)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorWork() when $default != null:
        return $default(_that.id, _that.title, _that.firstPublishDate);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title, String? firstPublishDate)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWork():
        return $default(_that.id, _that.title, _that.firstPublishDate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String title, String? firstPublishDate)?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWork() when $default != null:
        return $default(_that.id, _that.title, _that.firstPublishDate);
      case _:
        return null;
    }
  }
}

class _AuthorWork implements AuthorWork {
  const _AuthorWork({
    required this.id,
    required this.title,
    this.firstPublishDate,
  });

  @override
  final String id;
  @override
  final String title;
  @override
  final String? firstPublishDate;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorWorkCopyWith<_AuthorWork> get copyWith =>
      __$AuthorWorkCopyWithImpl<_AuthorWork>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorWork &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPublishDate, firstPublishDate) ||
                other.firstPublishDate == firstPublishDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, firstPublishDate);

  @override
  String toString() {
    return 'AuthorWork(id: $id, title: $title, firstPublishDate: $firstPublishDate)';
  }
}

abstract mixin class _$AuthorWorkCopyWith<$Res>
    implements $AuthorWorkCopyWith<$Res> {
  factory _$AuthorWorkCopyWith(
    _AuthorWork value,
    $Res Function(_AuthorWork) _then,
  ) = __$AuthorWorkCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title, String? firstPublishDate});
}

class __$AuthorWorkCopyWithImpl<$Res> implements _$AuthorWorkCopyWith<$Res> {
  __$AuthorWorkCopyWithImpl(this._self, this._then);

  final _AuthorWork _self;
  final $Res Function(_AuthorWork) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? firstPublishDate = freezed,
  }) {
    return _then(
      _AuthorWork(
        id: null == id ? _self.id : id as String,
        title: null == title ? _self.title : title as String,
        firstPublishDate: freezed == firstPublishDate
            ? _self.firstPublishDate
            : firstPublishDate as String?,
      ),
    );
  }
}

mixin _$PageResult<T> {
  List<T> get items;
  int get total;
  int get offset;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PageResultCopyWith<T, PageResult<T>> get copyWith =>
      _$PageResultCopyWithImpl<T, PageResult<T>>(
        this as PageResult<T>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PageResult<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(items),
    total,
    offset,
  );

  @override
  String toString() {
    return 'PageResult<$T>(items: $items, total: $total, offset: $offset)';
  }
}

abstract mixin class $PageResultCopyWith<T, $Res> {
  factory $PageResultCopyWith(
    PageResult<T> value,
    $Res Function(PageResult<T>) _then,
  ) = _$PageResultCopyWithImpl;
  @useResult
  $Res call({List<T> items, int total, int offset});
}

class _$PageResultCopyWithImpl<T, $Res>
    implements $PageResultCopyWith<T, $Res> {
  _$PageResultCopyWithImpl(this._self, this._then);

  final PageResult<T> _self;
  final $Res Function(PageResult<T>) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? offset = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items ? _self.items : items as List<T>,
        total: null == total ? _self.total : total as int,
        offset: null == offset ? _self.offset : offset as int,
      ),
    );
  }
}

extension PageResultPatterns<T> on PageResult<T> {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PageResult<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PageResult() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PageResult<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PageResult():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PageResult<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PageResult() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<T> items, int total, int offset)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PageResult() when $default != null:
        return $default(_that.items, _that.total, _that.offset);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<T> items, int total, int offset) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PageResult():
        return $default(_that.items, _that.total, _that.offset);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<T> items, int total, int offset)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PageResult() when $default != null:
        return $default(_that.items, _that.total, _that.offset);
      case _:
        return null;
    }
  }
}

class _PageResult<T> extends PageResult<T> {
  const _PageResult({
    required final List<T> items,
    required this.total,
    required this.offset,
  }) : _items = items,
       super._();

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;

    return EqualUnmodifiableListView(_items);
  }

  @override
  final int total;
  @override
  final int offset;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PageResultCopyWith<T, _PageResult<T>> get copyWith =>
      __$PageResultCopyWithImpl<T, _PageResult<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PageResult<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    total,
    offset,
  );

  @override
  String toString() {
    return 'PageResult<$T>(items: $items, total: $total, offset: $offset)';
  }
}

abstract mixin class _$PageResultCopyWith<T, $Res>
    implements $PageResultCopyWith<T, $Res> {
  factory _$PageResultCopyWith(
    _PageResult<T> value,
    $Res Function(_PageResult<T>) _then,
  ) = __$PageResultCopyWithImpl;
  @override
  @useResult
  $Res call({List<T> items, int total, int offset});
}

class __$PageResultCopyWithImpl<T, $Res>
    implements _$PageResultCopyWith<T, $Res> {
  __$PageResultCopyWithImpl(this._self, this._then);

  final _PageResult<T> _self;
  final $Res Function(_PageResult<T>) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? total = null,
    Object? offset = null,
  }) {
    return _then(
      _PageResult<T>(
        items: null == items ? _self._items : items as List<T>,
        total: null == total ? _self.total : total as int,
        offset: null == offset ? _self.offset : offset as int,
      ),
    );
  }
}
