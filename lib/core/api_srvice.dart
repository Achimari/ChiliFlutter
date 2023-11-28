import 'dart:convert';
import 'package:chili_tusk/core/responce/gifs_item.dart';
import 'package:chili_tusk/core/responce/gifs_responce.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {
  Future<List<GifsItem>> searchGifs(
      String query,
      String apiKey,
      int limit,
      int offset,
      String? sinceId,
      );
}

class ApiServiceImplementation implements ApiService {
  @override
  Future<List<GifsItem>> searchGifs(
      String query,
      String apiKey,
      int limit,
      int offset,
      String? sinceId,
      ) async {
    final Uri uri = Uri.https(
      'api.giphy.com',
      '/v1/gifs/search',
      {
        'q': query,
        'api_key': apiKey,
        'limit': limit.toString(),
        'offset': offset.toString(),
        'min_id': sinceId ?? '',
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final gifsResponse = GifsResponse.fromJson(responseData);
      return gifsResponse.data;
    } else {
      throw Exception('Failed to load GIFs');
    }
  }
}
