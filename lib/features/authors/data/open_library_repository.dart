import '../../../core/app_failure.dart';
import '../domain/author.dart';
import '../domain/author_repository.dart';
import 'open_library_api.dart';

class OpenLibraryRepository implements AuthorRepository {
  const OpenLibraryRepository(this.api);
  final OpenLibraryApi api;

  @override
  Future<PageResult<Author>> search(String query, {int offset = 0}) async {
    final data = await api.search(query, offset);
    return PageResult(
      items: _entries(data, 'docs')
          .map(
            (json) => Author(
              id: _required(json, 'key').split('/').last,
              name: _required(json, 'name'),
              birthDate: _optional(json, 'birth_date'),
              deathDate: _optional(json, 'death_date'),
              topWork: _optional(json, 'top_work'),
            ),
          )
          .toList(),
      total: _total(data, 'numFound'),
      offset: offset,
    );
  }

  @override
  Future<PageResult<AuthorWork>> works(
    String authorId, {
    int offset = 0,
  }) async {
    final data = await api.works(authorId, offset);
    return PageResult(
      items: _entries(data, 'entries')
          .map(
            (json) => AuthorWork(
              id: _required(json, 'key'),
              title: _required(json, 'title'),
              firstPublishDate: _optional(json, 'first_publish_date'),
            ),
          )
          .toList(),
      total: _total(data, 'size'),
      offset: offset,
    );
  }

  static List<Map<String, dynamic>> _entries(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];
    if (value is! List || value.any((item) => item is! Map<String, dynamic>)) {
      throw const AppFailure(
        'Open Library returned invalid records. Please retry.',
      );
    }
    return value.cast<Map<String, dynamic>>();
  }

  static int _total(Map<String, dynamic> json, String key) {
    final value = json[key];
    if (value is! int || value < 0) {
      throw const AppFailure('Open Library returned an invalid result count.');
    }
    return value;
  }

  static String _required(Map<String, dynamic> json, String key) {
    final value = _optional(json, key);
    if (value == null) {
      throw const AppFailure('Open Library returned an incomplete record.');
    }
    return value;
  }

  static String? _optional(Map<String, dynamic> json, String key) {
    final value = json[key];
    return value is String && value.trim().isNotEmpty ? value.trim() : null;
  }
}
