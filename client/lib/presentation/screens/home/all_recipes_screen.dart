import 'package:flutter/material.dart';

class AllRecipesScreen extends StatelessWidget {
  const AllRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'title': 'Airfryer', 'image': 'https://picsum.photos/id/1080/200/200'},
      {'title': 'Dinner', 'image': 'https://picsum.photos/id/1060/200/200'},
      {'title': 'Snacks', 'image': 'https://picsum.photos/id/1070/200/200'},
      {'title': 'Legumes', 'image': 'https://picsum.photos/id/1084/200/200'},
      {'title': 'Fish', 'image': 'https://picsum.photos/id/102/200/200'},
      {'title': 'Baby Food', 'image': 'https://picsum.photos/id/225/200/200'},
      {'title': 'Pastry', 'image': 'https://picsum.photos/id/292/200/200'},
      {'title': 'Desserts', 'image': 'https://picsum.photos/id/1062/200/200'},
      {'title': 'Kids', 'image': 'https://picsum.photos/id/1069/200/200'},
      {'title': 'Soup', 'image': 'https://picsum.photos/id/1080/200/200'},
      {'title': 'Baking', 'image': 'https://picsum.photos/id/1060/200/200'},
      {'title': 'Seafood', 'image': 'https://picsum.photos/id/1070/200/200'},
      {'title': 'Diet', 'image': 'https://picsum.photos/id/1084/200/200'},
      {'title': 'Healthy', 'image': 'https://picsum.photos/id/102/200/200'},
      {'title': 'Dolma', 'image': 'https://picsum.photos/id/225/200/200'},
      {'title': 'Ice Cream', 'image': 'https://picsum.photos/id/292/200/200'},
      {'title': 'World', 'image': 'https://picsum.photos/id/1062/200/200'},
      {'title': 'Bread', 'image': 'https://picsum.photos/id/1069/200/200'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: Colors.grey, size: 20),
              SizedBox(width: 8),
              Text(
                'Search in categories',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category['title']!,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                    child: Image.network(
                      category['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.fastfood, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
