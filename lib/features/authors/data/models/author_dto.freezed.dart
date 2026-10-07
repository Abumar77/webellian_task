part of 'author_dto.dart';

T _$identity<T>(T value) => value;

mixin _$AuthorDto {
  @JsonKey(name: 'key', fromJson: _requiredText)
  String get key;
  @JsonKey(fromJson: _requiredText)
  String get name;
  @JsonKey(name: 'birth_date', fromJson: _optionalText)
  String? get birthDate;
  @JsonKey(name: 'death_date', fromJson: _optionalText)
  String? get deathDate;
  @JsonKey(name: 'top_work', fromJson: _optionalText)
  String? get topWork;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorDtoCopyWith<AuthorDto> get copyWith =>
      _$AuthorDtoCopyWithImpl<AuthorDto>(this as AuthorDto, _$identity);

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorDto &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.topWork, topWork) || other.topWork == topWork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, key, name, birthDate, deathDate, topWork);

  @override
  String toString() {
    return 'AuthorDto(key: $key, name: $name, birthDate: $birthDate, deathDate: $deathDate, topWork: $topWork)';
  }
}

abstract mixin class $AuthorDtoCopyWith<$Res> {
  factory $AuthorDtoCopyWith(AuthorDto value, $Res Function(AuthorDto) _then) =
      _$AuthorDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'key', fromJson: _requiredText) String key,
    @JsonKey(fromJson: _requiredText) String name,
    @JsonKey(name: 'birth_date', fromJson: _optionalText) String? birthDate,
    @JsonKey(name: 'death_date', fromJson: _optionalText) String? deathDate,
    @JsonKey(name: 'top_work', fromJson: _optionalText) String? topWork,
  });
}

class _$AuthorDtoCopyWithImpl<$Res> implements $AuthorDtoCopyWith<$Res> {
  _$AuthorDtoCopyWithImpl(this._self, this._then);

  final AuthorDto _self;
  final $Res Function(AuthorDto) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? birthDate = freezed,
    Object? deathDate = freezed,
    Object? topWork = freezed,
  }) {
    return _then(
      _self.copyWith(
        key: null == key ? _self.key : key as String,
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

extension AuthorDtoPatterns on AuthorDto {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthorDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthorDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthorDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'key', fromJson: _requiredText) String key,
      @JsonKey(fromJson: _requiredText) String name,
      @JsonKey(name: 'birth_date', fromJson: _optionalText) String? birthDate,
      @JsonKey(name: 'death_date', fromJson: _optionalText) String? deathDate,
      @JsonKey(name: 'top_work', fromJson: _optionalText) String? topWork,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorDto() when $default != null:
        return $default(
          _that.key,
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
      @JsonKey(name: 'key', fromJson: _requiredText) String key,
      @JsonKey(fromJson: _requiredText) String name,
      @JsonKey(name: 'birth_date', fromJson: _optionalText) String? birthDate,
      @JsonKey(name: 'death_date', fromJson: _optionalText) String? deathDate,
      @JsonKey(name: 'top_work', fromJson: _optionalText) String? topWork,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorDto():
        return $default(
          _that.key,
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
      @JsonKey(name: 'key', fromJson: _requiredText) String key,
      @JsonKey(fromJson: _requiredText) String name,
      @JsonKey(name: 'birth_date', fromJson: _optionalText) String? birthDate,
      @JsonKey(name: 'death_date', fromJson: _optionalText) String? deathDate,
      @JsonKey(name: 'top_work', fromJson: _optionalText) String? topWork,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorDto() when $default != null:
        return $default(
          _that.key,
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

@JsonSerializable(checked: true)
class _AuthorDto extends AuthorDto {
  const _AuthorDto({
    @JsonKey(name: 'key', fromJson: _requiredText) required this.key,
    @JsonKey(fromJson: _requiredText) required this.name,
    @JsonKey(name: 'birth_date', fromJson: _optionalText) this.birthDate,
    @JsonKey(name: 'death_date', fromJson: _optionalText) this.deathDate,
    @JsonKey(name: 'top_work', fromJson: _optionalText) this.topWork,
  }) : super._();
  factory _AuthorDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorDtoFromJson(json);

  @override
  @JsonKey(name: 'key', fromJson: _requiredText)
  final String key;
  @override
  @JsonKey(fromJson: _requiredText)
  final String name;
  @override
  @JsonKey(name: 'birth_date', fromJson: _optionalText)
  final String? birthDate;
  @override
  @JsonKey(name: 'death_date', fromJson: _optionalText)
  final String? deathDate;
  @override
  @JsonKey(name: 'top_work', fromJson: _optionalText)
  final String? topWork;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorDtoCopyWith<_AuthorDto> get copyWith =>
      __$AuthorDtoCopyWithImpl<_AuthorDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorDto &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.deathDate, deathDate) ||
                other.deathDate == deathDate) &&
            (identical(other.topWork, topWork) || other.topWork == topWork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, key, name, birthDate, deathDate, topWork);

  @override
  String toString() {
    return 'AuthorDto(key: $key, name: $name, birthDate: $birthDate, deathDate: $deathDate, topWork: $topWork)';
  }
}

abstract mixin class _$AuthorDtoCopyWith<$Res>
    implements $AuthorDtoCopyWith<$Res> {
  factory _$AuthorDtoCopyWith(
    _AuthorDto value,
    $Res Function(_AuthorDto) _then,
  ) = __$AuthorDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'key', fromJson: _requiredText) String key,
    @JsonKey(fromJson: _requiredText) String name,
    @JsonKey(name: 'birth_date', fromJson: _optionalText) String? birthDate,
    @JsonKey(name: 'death_date', fromJson: _optionalText) String? deathDate,
    @JsonKey(name: 'top_work', fromJson: _optionalText) String? topWork,
  });
}

class __$AuthorDtoCopyWithImpl<$Res> implements _$AuthorDtoCopyWith<$Res> {
  __$AuthorDtoCopyWithImpl(this._self, this._then);

  final _AuthorDto _self;
  final $Res Function(_AuthorDto) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? birthDate = freezed,
    Object? deathDate = freezed,
    Object? topWork = freezed,
  }) {
    return _then(
      _AuthorDto(
        key: null == key ? _self.key : key as String,
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

mixin _$AuthorWorkDto {
  @JsonKey(name: 'key', fromJson: _requiredText)
  String get key;
  @JsonKey(fromJson: _requiredText)
  String get title;
  @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
  String? get firstPublishDate;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorWorkDtoCopyWith<AuthorWorkDto> get copyWith =>
      _$AuthorWorkDtoCopyWithImpl<AuthorWorkDto>(
        this as AuthorWorkDto,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorWorkDto &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPublishDate, firstPublishDate) ||
                other.firstPublishDate == firstPublishDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, title, firstPublishDate);

  @override
  String toString() {
    return 'AuthorWorkDto(key: $key, title: $title, firstPublishDate: $firstPublishDate)';
  }
}

abstract mixin class $AuthorWorkDtoCopyWith<$Res> {
  factory $AuthorWorkDtoCopyWith(
    AuthorWorkDto value,
    $Res Function(AuthorWorkDto) _then,
  ) = _$AuthorWorkDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'key', fromJson: _requiredText) String key,
    @JsonKey(fromJson: _requiredText) String title,
    @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
    String? firstPublishDate,
  });
}

class _$AuthorWorkDtoCopyWithImpl<$Res>
    implements $AuthorWorkDtoCopyWith<$Res> {
  _$AuthorWorkDtoCopyWithImpl(this._self, this._then);

  final AuthorWorkDto _self;
  final $Res Function(AuthorWorkDto) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? firstPublishDate = freezed,
  }) {
    return _then(
      _self.copyWith(
        key: null == key ? _self.key : key as String,
        title: null == title ? _self.title : title as String,
        firstPublishDate: freezed == firstPublishDate
            ? _self.firstPublishDate
            : firstPublishDate as String?,
      ),
    );
  }
}

extension AuthorWorkDtoPatterns on AuthorWorkDto {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthorWorkDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorWorkDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthorWorkDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorkDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthorWorkDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorkDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'key', fromJson: _requiredText) String key,
      @JsonKey(fromJson: _requiredText) String title,
      @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
      String? firstPublishDate,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorWorkDto() when $default != null:
        return $default(_that.key, _that.title, _that.firstPublishDate);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'key', fromJson: _requiredText) String key,
      @JsonKey(fromJson: _requiredText) String title,
      @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
      String? firstPublishDate,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorkDto():
        return $default(_that.key, _that.title, _that.firstPublishDate);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'key', fromJson: _requiredText) String key,
      @JsonKey(fromJson: _requiredText) String title,
      @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
      String? firstPublishDate,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorkDto() when $default != null:
        return $default(_that.key, _that.title, _that.firstPublishDate);
      case _:
        return null;
    }
  }
}

@JsonSerializable(checked: true)
class _AuthorWorkDto extends AuthorWorkDto {
  const _AuthorWorkDto({
    @JsonKey(name: 'key', fromJson: _requiredText) required this.key,
    @JsonKey(fromJson: _requiredText) required this.title,
    @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
    this.firstPublishDate,
  }) : super._();
  factory _AuthorWorkDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorWorkDtoFromJson(json);

  @override
  @JsonKey(name: 'key', fromJson: _requiredText)
  final String key;
  @override
  @JsonKey(fromJson: _requiredText)
  final String title;
  @override
  @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
  final String? firstPublishDate;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorWorkDtoCopyWith<_AuthorWorkDto> get copyWith =>
      __$AuthorWorkDtoCopyWithImpl<_AuthorWorkDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorWorkDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorWorkDto &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstPublishDate, firstPublishDate) ||
                other.firstPublishDate == firstPublishDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, title, firstPublishDate);

  @override
  String toString() {
    return 'AuthorWorkDto(key: $key, title: $title, firstPublishDate: $firstPublishDate)';
  }
}

abstract mixin class _$AuthorWorkDtoCopyWith<$Res>
    implements $AuthorWorkDtoCopyWith<$Res> {
  factory _$AuthorWorkDtoCopyWith(
    _AuthorWorkDto value,
    $Res Function(_AuthorWorkDto) _then,
  ) = __$AuthorWorkDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'key', fromJson: _requiredText) String key,
    @JsonKey(fromJson: _requiredText) String title,
    @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
    String? firstPublishDate,
  });
}

class __$AuthorWorkDtoCopyWithImpl<$Res>
    implements _$AuthorWorkDtoCopyWith<$Res> {
  __$AuthorWorkDtoCopyWithImpl(this._self, this._then);

  final _AuthorWorkDto _self;
  final $Res Function(_AuthorWorkDto) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? firstPublishDate = freezed,
  }) {
    return _then(
      _AuthorWorkDto(
        key: null == key ? _self.key : key as String,
        title: null == title ? _self.title : title as String,
        firstPublishDate: freezed == firstPublishDate
            ? _self.firstPublishDate
            : firstPublishDate as String?,
      ),
    );
  }
}

mixin _$AuthorSearchResponseDto {
  @JsonKey(name: 'docs')
  List<AuthorDto> get authors;
  @JsonKey(name: 'numFound', fromJson: _count)
  int get total;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorSearchResponseDtoCopyWith<AuthorSearchResponseDto> get copyWith =>
      _$AuthorSearchResponseDtoCopyWithImpl<AuthorSearchResponseDto>(
        this as AuthorSearchResponseDto,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorSearchResponseDto &&
            const DeepCollectionEquality().equals(other.authors, authors) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(authors),
    total,
  );

  @override
  String toString() {
    return 'AuthorSearchResponseDto(authors: $authors, total: $total)';
  }
}

abstract mixin class $AuthorSearchResponseDtoCopyWith<$Res> {
  factory $AuthorSearchResponseDtoCopyWith(
    AuthorSearchResponseDto value,
    $Res Function(AuthorSearchResponseDto) _then,
  ) = _$AuthorSearchResponseDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'docs') List<AuthorDto> authors,
    @JsonKey(name: 'numFound', fromJson: _count) int total,
  });
}

class _$AuthorSearchResponseDtoCopyWithImpl<$Res>
    implements $AuthorSearchResponseDtoCopyWith<$Res> {
  _$AuthorSearchResponseDtoCopyWithImpl(this._self, this._then);

  final AuthorSearchResponseDto _self;
  final $Res Function(AuthorSearchResponseDto) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? authors = null, Object? total = null}) {
    return _then(
      _self.copyWith(
        authors: null == authors ? _self.authors : authors as List<AuthorDto>,
        total: null == total ? _self.total : total as int,
      ),
    );
  }
}

extension AuthorSearchResponseDtoPatterns on AuthorSearchResponseDto {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthorSearchResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorSearchResponseDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthorSearchResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorSearchResponseDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthorSearchResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorSearchResponseDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'docs') List<AuthorDto> authors,
      @JsonKey(name: 'numFound', fromJson: _count) int total,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorSearchResponseDto() when $default != null:
        return $default(_that.authors, _that.total);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'docs') List<AuthorDto> authors,
      @JsonKey(name: 'numFound', fromJson: _count) int total,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorSearchResponseDto():
        return $default(_that.authors, _that.total);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'docs') List<AuthorDto> authors,
      @JsonKey(name: 'numFound', fromJson: _count) int total,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorSearchResponseDto() when $default != null:
        return $default(_that.authors, _that.total);
      case _:
        return null;
    }
  }
}

@JsonSerializable(checked: true, explicitToJson: true)
class _AuthorSearchResponseDto implements AuthorSearchResponseDto {
  const _AuthorSearchResponseDto({
    @JsonKey(name: 'docs') required final List<AuthorDto> authors,
    @JsonKey(name: 'numFound', fromJson: _count) required this.total,
  }) : _authors = authors;
  factory _AuthorSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorSearchResponseDtoFromJson(json);

  final List<AuthorDto> _authors;
  @override
  @JsonKey(name: 'docs')
  List<AuthorDto> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;

    return EqualUnmodifiableListView(_authors);
  }

  @override
  @JsonKey(name: 'numFound', fromJson: _count)
  final int total;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorSearchResponseDtoCopyWith<_AuthorSearchResponseDto> get copyWith =>
      __$AuthorSearchResponseDtoCopyWithImpl<_AuthorSearchResponseDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorSearchResponseDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorSearchResponseDto &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_authors),
    total,
  );

  @override
  String toString() {
    return 'AuthorSearchResponseDto(authors: $authors, total: $total)';
  }
}

abstract mixin class _$AuthorSearchResponseDtoCopyWith<$Res>
    implements $AuthorSearchResponseDtoCopyWith<$Res> {
  factory _$AuthorSearchResponseDtoCopyWith(
    _AuthorSearchResponseDto value,
    $Res Function(_AuthorSearchResponseDto) _then,
  ) = __$AuthorSearchResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'docs') List<AuthorDto> authors,
    @JsonKey(name: 'numFound', fromJson: _count) int total,
  });
}

class __$AuthorSearchResponseDtoCopyWithImpl<$Res>
    implements _$AuthorSearchResponseDtoCopyWith<$Res> {
  __$AuthorSearchResponseDtoCopyWithImpl(this._self, this._then);

  final _AuthorSearchResponseDto _self;
  final $Res Function(_AuthorSearchResponseDto) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? authors = null, Object? total = null}) {
    return _then(
      _AuthorSearchResponseDto(
        authors: null == authors ? _self._authors : authors as List<AuthorDto>,
        total: null == total ? _self.total : total as int,
      ),
    );
  }
}

mixin _$AuthorWorksResponseDto {
  @JsonKey(name: 'entries')
  List<AuthorWorkDto> get works;
  @JsonKey(name: 'size', fromJson: _count)
  int get total;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthorWorksResponseDtoCopyWith<AuthorWorksResponseDto> get copyWith =>
      _$AuthorWorksResponseDtoCopyWithImpl<AuthorWorksResponseDto>(
        this as AuthorWorksResponseDto,
        _$identity,
      );

  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthorWorksResponseDto &&
            const DeepCollectionEquality().equals(other.works, works) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(works),
    total,
  );

  @override
  String toString() {
    return 'AuthorWorksResponseDto(works: $works, total: $total)';
  }
}

abstract mixin class $AuthorWorksResponseDtoCopyWith<$Res> {
  factory $AuthorWorksResponseDtoCopyWith(
    AuthorWorksResponseDto value,
    $Res Function(AuthorWorksResponseDto) _then,
  ) = _$AuthorWorksResponseDtoCopyWithImpl;
  @useResult
  $Res call({
    @JsonKey(name: 'entries') List<AuthorWorkDto> works,
    @JsonKey(name: 'size', fromJson: _count) int total,
  });
}

class _$AuthorWorksResponseDtoCopyWithImpl<$Res>
    implements $AuthorWorksResponseDtoCopyWith<$Res> {
  _$AuthorWorksResponseDtoCopyWithImpl(this._self, this._then);

  final AuthorWorksResponseDto _self;
  final $Res Function(AuthorWorksResponseDto) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? works = null, Object? total = null}) {
    return _then(
      _self.copyWith(
        works: null == works ? _self.works : works as List<AuthorWorkDto>,
        total: null == total ? _self.total : total as int,
      ),
    );
  }
}

extension AuthorWorksResponseDtoPatterns on AuthorWorksResponseDto {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuthorWorksResponseDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorWorksResponseDto() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuthorWorksResponseDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorksResponseDto():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuthorWorksResponseDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorksResponseDto() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'entries') List<AuthorWorkDto> works,
      @JsonKey(name: 'size', fromJson: _count) int total,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuthorWorksResponseDto() when $default != null:
        return $default(_that.works, _that.total);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      @JsonKey(name: 'entries') List<AuthorWorkDto> works,
      @JsonKey(name: 'size', fromJson: _count) int total,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorksResponseDto():
        return $default(_that.works, _that.total);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      @JsonKey(name: 'entries') List<AuthorWorkDto> works,
      @JsonKey(name: 'size', fromJson: _count) int total,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuthorWorksResponseDto() when $default != null:
        return $default(_that.works, _that.total);
      case _:
        return null;
    }
  }
}

@JsonSerializable(checked: true, explicitToJson: true)
class _AuthorWorksResponseDto implements AuthorWorksResponseDto {
  const _AuthorWorksResponseDto({
    @JsonKey(name: 'entries') required final List<AuthorWorkDto> works,
    @JsonKey(name: 'size', fromJson: _count) required this.total,
  }) : _works = works;
  factory _AuthorWorksResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorWorksResponseDtoFromJson(json);

  final List<AuthorWorkDto> _works;
  @override
  @JsonKey(name: 'entries')
  List<AuthorWorkDto> get works {
    if (_works is EqualUnmodifiableListView) return _works;

    return EqualUnmodifiableListView(_works);
  }

  @override
  @JsonKey(name: 'size', fromJson: _count)
  final int total;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuthorWorksResponseDtoCopyWith<_AuthorWorksResponseDto> get copyWith =>
      __$AuthorWorksResponseDtoCopyWithImpl<_AuthorWorksResponseDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$AuthorWorksResponseDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorWorksResponseDto &&
            const DeepCollectionEquality().equals(other._works, _works) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_works),
    total,
  );

  @override
  String toString() {
    return 'AuthorWorksResponseDto(works: $works, total: $total)';
  }
}

abstract mixin class _$AuthorWorksResponseDtoCopyWith<$Res>
    implements $AuthorWorksResponseDtoCopyWith<$Res> {
  factory _$AuthorWorksResponseDtoCopyWith(
    _AuthorWorksResponseDto value,
    $Res Function(_AuthorWorksResponseDto) _then,
  ) = __$AuthorWorksResponseDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'entries') List<AuthorWorkDto> works,
    @JsonKey(name: 'size', fromJson: _count) int total,
  });
}

class __$AuthorWorksResponseDtoCopyWithImpl<$Res>
    implements _$AuthorWorksResponseDtoCopyWith<$Res> {
  __$AuthorWorksResponseDtoCopyWithImpl(this._self, this._then);

  final _AuthorWorksResponseDto _self;
  final $Res Function(_AuthorWorksResponseDto) _then;

  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? works = null, Object? total = null}) {
    return _then(
      _AuthorWorksResponseDto(
        works: null == works ? _self._works : works as List<AuthorWorkDto>,
        total: null == total ? _self.total : total as int,
      ),
    );
  }
}
