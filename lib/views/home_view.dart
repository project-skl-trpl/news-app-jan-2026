import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_trpl_c/controllers/news_controller.dart';
import 'package:news_app_trpl_c/routes/app_pages.dart';
import 'package:news_app_trpl_c/widgets/category_chip.dart';
import 'package:news_app_trpl_c/widgets/loading_shimmer.dart';
import 'package:news_app_trpl_c/widgets/news_card.dart';

class HomeView extends GetView<NewsController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.fetchTopHeadlines();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Obx(
                  () => CategoryChip(
                    label: category.capitalize ?? 'No Category',
                    isSelected: controller.selectedCategory == category,
                    onTap: () {
                      controller.selectCategory(category);
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading) {
                return LoadingShimmer();
                // return const Center(child: CircularProgressIndicator());
              }
              if (controller.articles.isEmpty) {
                return Center(
                  child: Text("Belum ada data ${controller.error}"),
                );
              }
              return ListView.builder(
                itemCount: controller.articles.length,
                itemBuilder: (context, index) {
                  final article = controller.articles[index];
                  return NewsCard(
                    article: article,
                    onTap: () {
                      Get.toNamed(Routes.NEWS_DETAIL, arguments: article);
                      // Get.snackbar(
                      //   "Detail Berita",
                      //   article.title ?? "",
                      //   snackPosition: SnackPosition.BOTTOM,
                      // );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
