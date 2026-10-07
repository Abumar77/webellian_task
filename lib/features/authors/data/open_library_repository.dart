import 'package:flutter/foundation.dart';
import '../domain/author.dart';
import '../domain/author_repository.dart';
import 'parsing/author_response_parser.dart';
import 'open_library_api.dart';

class OpenLibraryRepository implements AuthorRepository {
  const OpenLibraryRepository(this.api);
  final OpenLibraryApi api;

  @override
  Future<PageResult<Author>> search(String query, {int offset = 0}) async {
    final json = await api.search(query, offset);
    return compute(AuthorResponseParser.parseAuthors, (
      json,
      offset,
    ), debugLabel: 'parseAuthors');
  }

  @override
  Future<PageResult<AuthorWork>> works(
    String authorId, {
    int offset = 0,
  }) async {
    final json = await api.works(authorId, offset);
    return compute(AuthorResponseParser.parseWorks, (
      json,
      offset,
    ), debugLabel: 'parseAuthorWorks');
  }
}
