import 'author.dart';

abstract interface class AuthorRepository {
  Future<PageResult<Author>> search(String query, {int offset = 0});
  Future<PageResult<AuthorWork>> works(String authorId, {int offset = 0});
}

class SearchAuthors {
  const SearchAuthors(this.repository);
  final AuthorRepository repository;
  Future<PageResult<Author>> call(String query, {int offset = 0}) =>
      repository.search(query, offset: offset);
}

class GetAuthorWorks {
  const GetAuthorWorks(this.repository);
  final AuthorRepository repository;
  Future<PageResult<AuthorWork>> call(String id, {int offset = 0}) =>
      repository.works(id, offset: offset);
}
