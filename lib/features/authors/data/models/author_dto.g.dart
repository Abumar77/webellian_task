part of 'author_dto.dart';

_AuthorDto _$AuthorDtoFromJson(Map<String, dynamic> json) => $checkedCreate(
  '_AuthorDto',
  json,
  ($checkedConvert) {
    final val = _AuthorDto(
      key: $checkedConvert('key', (v) => _requiredText(v)),
      name: $checkedConvert('name', (v) => _requiredText(v)),
      birthDate: $checkedConvert('birth_date', (v) => _optionalText(v)),
      deathDate: $checkedConvert('death_date', (v) => _optionalText(v)),
      topWork: $checkedConvert('top_work', (v) => _optionalText(v)),
    );
    return val;
  },
  fieldKeyMap: const {
    'birthDate': 'birth_date',
    'deathDate': 'death_date',
    'topWork': 'top_work',
  },
);

Map<String, dynamic> _$AuthorDtoToJson(_AuthorDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'birth_date': instance.birthDate,
      'death_date': instance.deathDate,
      'top_work': instance.topWork,
    };

_AuthorWorkDto _$AuthorWorkDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_AuthorWorkDto',
      json,
      ($checkedConvert) {
        final val = _AuthorWorkDto(
          key: $checkedConvert('key', (v) => _requiredText(v)),
          title: $checkedConvert('title', (v) => _requiredText(v)),
          firstPublishDate: $checkedConvert(
            'first_publish_date',
            (v) => _optionalText(v),
          ),
        );
        return val;
      },
      fieldKeyMap: const {'firstPublishDate': 'first_publish_date'},
    );

Map<String, dynamic> _$AuthorWorkDtoToJson(_AuthorWorkDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'first_publish_date': instance.firstPublishDate,
    };

_AuthorSearchResponseDto _$AuthorSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AuthorSearchResponseDto',
  json,
  ($checkedConvert) {
    final val = _AuthorSearchResponseDto(
      authors: $checkedConvert(
        'docs',
        (v) => (v as List<dynamic>)
            .map((e) => AuthorDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      total: $checkedConvert('numFound', (v) => _count(v)),
    );
    return val;
  },
  fieldKeyMap: const {'authors': 'docs', 'total': 'numFound'},
);

Map<String, dynamic> _$AuthorSearchResponseDtoToJson(
  _AuthorSearchResponseDto instance,
) => <String, dynamic>{
  'docs': instance.authors.map((e) => e.toJson()).toList(),
  'numFound': instance.total,
};

_AuthorWorksResponseDto _$AuthorWorksResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  '_AuthorWorksResponseDto',
  json,
  ($checkedConvert) {
    final val = _AuthorWorksResponseDto(
      works: $checkedConvert(
        'entries',
        (v) => (v as List<dynamic>)
            .map((e) => AuthorWorkDto.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      total: $checkedConvert('size', (v) => _count(v)),
    );
    return val;
  },
  fieldKeyMap: const {'works': 'entries', 'total': 'size'},
);

Map<String, dynamic> _$AuthorWorksResponseDtoToJson(
  _AuthorWorksResponseDto instance,
) => <String, dynamic>{
  'entries': instance.works.map((e) => e.toJson()).toList(),
  'size': instance.total,
};
