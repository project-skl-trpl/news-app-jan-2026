import 'package:news_app_trpl_c/models/news_article.dart';

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<NewsArticle> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json["status"],
      totalResults: json["totalResults"],
      articles:
          json["articles"] == null
              ? []
              : List<NewsArticle>.from(
                json["articles"]!.map((x) => NewsArticle.fromJson(x)),
              ),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": articles.map((x) => x.toJson()).toList(),
  };
}
