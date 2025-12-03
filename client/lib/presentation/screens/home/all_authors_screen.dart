import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/home/author_card.dart';

class AllAuthorsScreen extends StatelessWidget {
  const AllAuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> authors = [
      {'name': 'Ferhat Bora', 'followers': '156.282', 'image': 'https://i.pravatar.cc/150?img=11', 'recipes': '45'},
      {'name': 'Yasemin Gürsürer', 'followers': '269.680', 'image': 'https://i.pravatar.cc/150?img=5', 'recipes': '128'},
      {'name': 'Ege Şahin', 'followers': '18.452', 'image': 'https://i.pravatar.cc/150?img=3', 'recipes': '32'},
      {'name': 'Leyla Günbay', 'followers': '17.505', 'image': 'https://i.pravatar.cc/150?img=9', 'recipes': '67'},
      {'name': 'Çigdem Esastürk', 'followers': '17.640', 'image': 'https://i.pravatar.cc/150?img=1', 'recipes': '22'},
      {'name': 'evdekendinpisir', 'followers': '22.785', 'image': 'https://i.pravatar.cc/150?img=8', 'recipes': '89'},
      {'name': 'Cemre Özgüzel', 'followers': '259.372', 'image': 'https://i.pravatar.cc/150?img=4', 'recipes': '150'},
      {'name': 'Emre Turan', 'followers': '86.357', 'image': 'https://i.pravatar.cc/150?img=12', 'recipes': '41'},
      {'name': 'Neşe Ümit Tan', 'followers': '67.075', 'image': 'https://i.pravatar.cc/150?img=10', 'recipes': '55'},
      {'name': 'İpek Erdoğan', 'followers': '28.247', 'image': 'https://i.pravatar.cc/150?img=2', 'recipes': '19'},
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
                        'Popular Chefs',
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                // Authors Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7, // Adjusted for AuthorCard height
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: authors.length,
                    itemBuilder: (context, index) {
                      final author = authors[index];
                      return SizedBox(
                        child: AuthorCard(
                          name: author['name']!,
                          imageUrl: author['image']!,
                          followers: author['followers']!,
                          recipes: author['recipes']!,
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
