import '../../../../core/parsing/json_parser.dart';
import '../../domain/author.dart';
import '../models/author_dto.dart';

typedef AuthorPageInput = (Map<String, dynamic> json, int offset);

abstract final class AuthorResponseParser {
  static PageResult<Author> parseAuthors(AuthorPageInput input) {
    final response = JsonParser.decode(
      input.$1,
      AuthorSearchResponseDto.fromJson,
    );
    return _page(
      items: response.authors,
      toDomain: (author) => author.toDomain(),
      total: response.total,
      offset: input.$2,
    );
  }

  static PageResult<AuthorWork> parseWorks(AuthorPageInput input) {
    final response = JsonParser.decode(
      input.$1,
      AuthorWorksResponseDto.fromJson,
    );
    return _page(
      items: response.works,
      toDomain: (work) => work.toDomain(),
      total: response.total,
      offset: input.$2,
    );
  }

  static PageResult<T> _page<D, T>({
    required List<D> items,
    required T Function(D) toDomain,
    required int total,
    required int offset,
  }) => PageResult(
    items: items.map(toDomain).toList(),
    total: total,
    offset: offset,
  );
}
