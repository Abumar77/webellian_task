import '../../../core/network/dio_client.dart';
import '../../../core/network/api_endpoints.dart';

class OpenLibraryApi {
  const OpenLibraryApi(this.client);
  final DioClient client;
  static const pageSize = 20;

  Future<Map<String, dynamic>> search(String query, int offset) =>
      client.getJson(ApiEndpoints.searchAuthors, {
        'q': query,
        'limit': pageSize,
        'offset': offset,
      });

  Future<Map<String, dynamic>> works(String id, int offset) => client.getJson(
    ApiEndpoints.authorWorks(id),
    {'limit': pageSize, 'offset': offset},
  );
}
