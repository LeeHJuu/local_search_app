import 'package:dio/dio.dart';
import 'package:local_search_app/data/model/location.dart';

class LocationRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));
  Future<List<Location>> searchLocations(String query) async {
    final response = await _client.get(
      'https://openapi.naver.com/v1/search/local.json',
      queryParameters: {
        'query': query,
        'display': 5,
      },
      options: Options(
        headers: {
          'X-Naver-Client-Id': 'OB_NItqk9WbDjgDBofIf',
          'X-Naver-Client-Secret': 'FD6R6L0g36',
        },
      ),
    );

    if (response.statusCode == 200) {
      final items = response.data['items'];
      final list = List.from(items);

      return list.map((item) {
        return Location.fromJson(item);
      }).toList();
    }

    return [];
  }
}
