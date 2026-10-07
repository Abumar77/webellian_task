import '../../../core/network/dio_client.dart';

class OpenLibraryApi {
  const OpenLibraryApi(this.client);
  final DioClient client;
  static const pageSize = 20;

  Future<Map<String, dynamic>> search(String query, int offset) =>
      client.getJson('/search/authors.json', {
        'q': query,
        'limit': pageSize,
        'offset': offset,
      });

  Future<Map<String, dynamic>> works(String id, int offset) => client.getJson(
    '/authors/${Uri.encodeComponent(id)}/works.json',
    {'limit': pageSize, 'offset': offset},
  );
}
