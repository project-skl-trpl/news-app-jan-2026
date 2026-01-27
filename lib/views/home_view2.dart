import 'package:flutter/material.dart';
import 'package:news_app_trpl_c/widgets/category_chip.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  String selectedCategory = 'All'; // state disimpan di sini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News App'), centerTitle: true),
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
                return CategoryChip(
                  label: category,
                  isSelected: category == selectedCategory,
                  onTap: () {
                    setState(() {
                      selectedCategory = category; // update state
                    });
                    // ignore: avoid_print
                    print('Selected category: $selectedCategory');
                  },
                );
              },
            ),
          ),
          // Nanti tambahkan konten berita di sini (misal berdasarkan selectedCategory)
          // Contoh placeholder:
          Expanded(
            child: Center(
              child: Text(
                'Menampilkan berita untuk kategori: $selectedCategory',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
