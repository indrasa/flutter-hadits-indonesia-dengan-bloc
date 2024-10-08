import 'package:dio/dio.dart';
import 'hadith_model.dart';

class HadithRepository {
  final Dio _dio = Dio();

  Future<List<Hadith>> fetchHadiths(int start, int limit) async {
    try {
      final response = await _dio.get(
          'https://api.hadith.gading.dev/books/muslim?range=$start-${start + limit}');
      if (response.statusCode == 200) {
        final List hadiths = response.data['data']['hadiths'];
        return hadiths.map((hadith) => Hadith.fromJson(hadith)).toList();
      }
    } catch (e) {
      throw Exception('Failed to load hadiths');
    }
    return [];
  }
}
