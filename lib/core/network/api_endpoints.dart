abstract final class ApiEndpoints {
  static const baseUrl = 'https://openlibrary.org';
  static const searchAuthors = '/search/authors.json';

  static String authorWorks(String authorId) =>
      '/authors/${Uri.encodeComponent(authorId)}/works.json';
}
