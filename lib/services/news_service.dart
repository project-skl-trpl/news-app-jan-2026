import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_trpl_c/models/news_response.dart';
import 'package:news_app_trpl_c/utils/constants.dart';

class NewsService {
  static const String _baseUrl = Constants.baseUrl;
  static final String _apiKey = Constants.apiKey;

  Future<NewsResponse> getToHeadlines({
    String country = Constants.defaultCountry,
    String? category,
    int page = 1,
    int pageSize = 20,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {
        'apiKey': _apiKey,
        'country': country,
        'page': page.toString(),
        'pageSize': pageSize.toString(),
      };
      if (category != null && category.isNotEmpty) {
        queryParams['category'] = category;
      }
      final Uri uri = Uri.parse(
        '$_baseUrl${Constants.topHeadlines}',
      ).replace(queryParameters: queryParams);
      // print(uri);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return NewsResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
