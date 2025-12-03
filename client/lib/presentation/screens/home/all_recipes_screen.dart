import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/home/recipe_card.dart';

class AllRecipesScreen extends StatelessWidget {
  const AllRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for recipes
    final List<Map<String, dynamic>> recipes = [
      {
        'title': 'Classic Margherita Pizza',
        'image': 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=500&q=80',
        'time': '45 min',
        'likes': 342,
        'author': 'Chef Mario',
        'authorImage': 'https://i.pravatar.cc/150?img=11',
      },
      {
        'title': 'Creamy Mushroom Risotto',
        'image': 'https://images.unsplash.com/photo-1476124369491-e7addf5db371?auto=format&fit=crop&w=500&q=80',
        'time': '30 min',
        'likes': 521,
        'author': 'Sarah Cook',
        'authorImage': 'https://i.pravatar.cc/150?img=5',
      },
      {
        'title': 'Grilled Salmon with Asparagus',
        'image': 'https://images.unsplash.com/photo-1467003909585-2f8a7270028d?auto=format&fit=crop&w=500&q=80',
        'time': '25 min',
        'likes': 890,
        'author': 'Gordon R.',
        'authorImage': 'https://i.pravatar.cc/150?img=3',
      },
      {
        'title': 'Berry Smoothie Bowl',
        'image': 'https://images.unsplash.com/photo-1577805947697-89e18249d767?auto=format&fit=crop&w=500&q=80',
        'time': '10 min',
        'likes': 120,
        'author': 'Healthy Life',
        'authorImage': 'https://i.pravatar.cc/150?img=9',
      },
      {
        'title': 'Homemade Burger',
        'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80',
        'time': '40 min',
        'likes': 654,
        'author': 'Burger King',
        'authorImage': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'title': 'Chocolate Lava Cake',
        'image': 'https://images.unsplash.com/photo-1606313564200-e75d5e30476d?auto=format&fit=crop&w=500&q=80',
        'time': '50 min',
        'likes': 999,
        'author': 'Sweet Tooth',
        'authorImage': 'https://i.pravatar.cc/150?img=10',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Left Pattern
          Positioned(
            top: -50,
            left: -65,
            child: SvgPicture.asset(
              'assets/componets svg vertor/forth.svg',
              width: 131,
              height: 131,
            ),
          ),
          
          // Top Right Pattern (Red, Rotated)
          Positioned(
            top: 100,
            right: -65,
            child: Transform.rotate(
              angle: 3.14159, // 180 degrees
              child: SvgPicture.asset(
                'assets/componets svg vertor/forth.svg',
                width: 131,
                height: 131,
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'All Recipes',
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Recipe Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6, // Adjusted for RecipeCard height
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return SizedBox(
                        // Wrap in SizedBox to constrain width if needed, though Grid handles it
                        child: RecipeCard(
                          imageUrl: recipe['image'],
                          title: recipe['title'],
                          time: recipe['time'],
                          likes: recipe['likes'],
                          authorName: recipe['author'],
                          authorImage: recipe['authorImage'],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
