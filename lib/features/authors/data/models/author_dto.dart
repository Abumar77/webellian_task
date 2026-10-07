import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/author.dart';

part 'author_dto.freezed.dart';
part 'author_dto.g.dart';

String _requiredText(Object? value) {
  final text = _optionalText(value);
  if (text == null) throw const FormatException('Missing required text');
  return text;
}

String? _optionalText(Object? value) =>
    value is String && value.trim().isNotEmpty ? value.trim() : null;

int _count(Object? value) {
  if (value is! int || value < 0) {
    throw const FormatException('Invalid result count');
  }
  return value;
}

@freezed
abstract class AuthorDto with _$AuthorDto {
  const AuthorDto._();

  @JsonSerializable(checked: true)
  const factory AuthorDto({
    @JsonKey(name: 'key', fromJson: _requiredText) required String key,
    @JsonKey(fromJson: _requiredText) required String name,
    @JsonKey(name: 'birth_date', fromJson: _optionalText) String? birthDate,
    @JsonKey(name: 'death_date', fromJson: _optionalText) String? deathDate,
    @JsonKey(name: 'top_work', fromJson: _optionalText) String? topWork,
  }) = _AuthorDto;

  factory AuthorDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorDtoFromJson(json);

  Author toDomain() => Author(
    id: key.split('/').last,
    name: name,
    birthDate: birthDate,
    deathDate: deathDate,
    topWork: topWork,
  );
}

@freezed
abstract class AuthorWorkDto with _$AuthorWorkDto {
  const AuthorWorkDto._();

  @JsonSerializable(checked: true)
  const factory AuthorWorkDto({
    @JsonKey(name: 'key', fromJson: _requiredText) required String key,
    @JsonKey(fromJson: _requiredText) required String title,
    @JsonKey(name: 'first_publish_date', fromJson: _optionalText)
    String? firstPublishDate,
  }) = _AuthorWorkDto;

  factory AuthorWorkDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorWorkDtoFromJson(json);

  AuthorWork toDomain() =>
      AuthorWork(id: key, title: title, firstPublishDate: firstPublishDate);
}

@freezed
abstract class AuthorSearchResponseDto with _$AuthorSearchResponseDto {
  @JsonSerializable(checked: true, explicitToJson: true)
  const factory AuthorSearchResponseDto({
    @JsonKey(name: 'docs') required List<AuthorDto> authors,
    @JsonKey(name: 'numFound', fromJson: _count) required int total,
  }) = _AuthorSearchResponseDto;

  factory AuthorSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorSearchResponseDtoFromJson(json);
}

@freezed
abstract class AuthorWorksResponseDto with _$AuthorWorksResponseDto {
  @JsonSerializable(checked: true, explicitToJson: true)
  const factory AuthorWorksResponseDto({
    @JsonKey(name: 'entries') required List<AuthorWorkDto> works,
    @JsonKey(name: 'size', fromJson: _count) required int total,
  }) = _AuthorWorksResponseDto;

  factory AuthorWorksResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorWorksResponseDtoFromJson(json);
}
