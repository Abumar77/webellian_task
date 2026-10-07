import 'package:json_annotation/json_annotation.dart';
import '../../../core/app_failure.dart';
import '../domain/author.dart';
import '../domain/author_repository.dart';
import 'models/author_dto.dart';
import 'open_library_api.dart';

class OpenLibraryRepository implements AuthorRepository {
  const OpenLibraryRepository(this.api);
  final OpenLibraryApi api;

  @override
  Future<PageResult<Author>> search(String query, {int offset = 0}) async {
    final response = _decode(
      await api.search(query, offset),
      AuthorSearchResponseDto.fromJson,
    );
    return PageResult(
      items: response.authors.map((author) => author.toDomain()).toList(),
      total: response.total,
      offset: offset,
    );
  }

  @override
  Future<PageResult<AuthorWork>> works(
    String authorId, {
    int offset = 0,
  }) async {
    final response = _decode(
      await api.works(authorId, offset),
      AuthorWorksResponseDto.fromJson,
    );
    return PageResult(
      items: response.works.map((work) => work.toDomain()).toList(),
      total: response.total,
      offset: offset,
    );
  }

  T _decode<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      return fromJson(json);
    } on CheckedFromJsonException {
      throw const AppFailure(
        'Open Library returned invalid records. Please retry.',
      );
    }
  }
}
