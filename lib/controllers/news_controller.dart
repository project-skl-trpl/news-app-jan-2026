import 'package:get/get.dart';
import 'package:news_app_trpl_c/models/news_article.dart';
import 'package:news_app_trpl_c/services/news_service.dart';
import 'package:news_app_trpl_c/utils/constants.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();

  // Obs variables
  final _isLoading = false.obs;
  final _articles = <NewsArticle>[].obs;
  final _selectedCategory = 'general'.obs;
  final _error = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  List<NewsArticle> get articles => _articles;
  String get selectedCategory => _selectedCategory.value;
  String get error => _error.value;
  List<String> get categories => Constants.categories;

  @override
  void onInit() {
    super.onInit();
    fetchTopHeadlines();
  }

  Future<void> fetchTopHeadlines({String? category}) async {
    try {
      _isLoading.value = true;
      _error.value = '';
      final response = await _newsService.getToHeadlines(
        category: category ?? _selectedCategory.value,
      );
      _articles.value = response.articles;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      _isLoading.value = false;
    }
  }

  void selectCategory(String category) {
    _selectedCategory.value = category;
    fetchTopHeadlines(category: category);
  }
}
