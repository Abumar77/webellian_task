import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';

@freezed
abstract class Author with _$Author {
  const factory Author({
    required String id,
    required String name,
    String? birthDate,
    String? deathDate,
    String? topWork,
  }) = _Author;
}

@freezed
abstract class AuthorWork with _$AuthorWork {
  const factory AuthorWork({
    required String id,
    required String title,
    String? firstPublishDate,
  }) = _AuthorWork;
}

@freezed
abstract class PageResult<T> with _$PageResult<T> {
  const PageResult._();

  const factory PageResult({
    required List<T> items,
    required int total,
    required int offset,
  }) = _PageResult<T>;

  int get nextOffset => offset + items.length;
  bool get hasMore => items.isNotEmpty && nextOffset < total;
}
