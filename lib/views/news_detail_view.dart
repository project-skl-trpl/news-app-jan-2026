import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:news_app_trpl_c/models/news_article.dart';

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsArticle article = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source!.name ?? 'Unknown Source'),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
      ),
    );
  }
}
