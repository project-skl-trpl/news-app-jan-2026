import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_trpl_c/widgets/category_chip.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'All',
      'Business',
      'Entertainment',
      'General',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];

    final RxString selectedCategory = 'All'.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Obx(
                  () => CategoryChip(
                    label: category,
                    isSelected: category == selectedCategory.value,
                    onTap: () {
                      selectedCategory.value = category;
                      // ignore: avoid_print
                      print(selectedCategory.value);
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(child: Obx(() => Text(selectedCategory.value))),
          ),
        ],
      ),
    );
  }
}
