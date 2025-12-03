import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/home/food_image_slider.dart';
import '../../widgets/home/recipe_card.dart';
import '../../widgets/home/author_card.dart';
import 'all_recipes_screen.dart';
import 'all_authors_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          // Bottom Left Pattern (Red)
          Positioned(
            bottom: 100,
            left: -65,
            child: SvgPicture.asset(
              'assets/componets svg vertor/forth.svg',
              width: 131,
              height: 131,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'), // Placeholder
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Test Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.notifications_outlined),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              Text(
                'Explore New Recipes',
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 0.64,
                ),
              ).animate().fadeIn().slideX(),
              
              const SizedBox(height: 24),
              
              // Search Bar
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search recipes...',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        
                      ),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/appbar icon/search.svg', // Using Group 1 as setting/filter placeholder
                          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                          width: 20,
                          height: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Categories
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _CategoryItem(
                      color: Colors.green[100]!, 
                      label: 'Salad',
                      imagePath: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=100&q=80',
                    ),
                    _CategoryItem(
                      color: Colors.orange[100]!, 
                      label: 'Pizza',
                      imagePath: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=100&q=80',
                    ),
                    _CategoryItem(
                      color: Colors.yellow[100]!, 
                      label: 'Pasta',
                      imagePath: 'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?auto=format&fit=crop&w=100&q=80',
                    ),
                    _CategoryItem(
                      color: Colors.purple[100]!, 
                      label: 'Steak',
                      imagePath: 'https://images.unsplash.com/photo-1600891964092-4316c288032e?auto=format&fit=crop&w=100&q=80',
                    ),
                    _CategoryItem(
                      color: Colors.pink[100]!, 
                      label: 'Dessert',
                      imagePath: 'https://images.unsplash.com/photo-1563729784474-d77dbb933a9e?auto=format&fit=crop&w=100&q=80',
                    ),
                    _CategoryItem(
                      color: Colors.blue[100]!, 
                      label: 'Drinks',
                      imagePath: 'https://images.unsplash.com/photo-1544145945-f90425340c7e?auto=format&fit=crop&w=100&q=80',
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Featured Item Slider
              const FoodImageSlider().animate().fadeIn().scale(),

              const SizedBox(height: 32),

              // Popular Recipes Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Recipes',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllRecipesScreen()),
                      );
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    RecipeCard(
                      imageUrl: 'https://picsum.photos/id/1080/400/400',
                      title: 'Strawberry Cream Cake',
                      time: '45 min',
                      likes: 342,
                      authorName: 'Sarah Baker',
                      authorImage: 'https://i.pravatar.cc/150?img=1',
                    ),
                    RecipeCard(
                      imageUrl: 'https://picsum.photos/id/1060/400/400',
                      title: 'Homemade Barista Coffee',
                      time: '10 min',
                      likes: 128,
                      authorName: 'Mike Brewer',
                      authorImage: 'https://i.pravatar.cc/150?img=2',
                    ),
                    RecipeCard(
                      imageUrl: 'https://picsum.photos/id/1070/400/400',
                      title: 'Spicy Vegetable Curry',
                      time: '35 min',
                      likes: 89,
                      authorName: 'Emma Cook',
                      authorImage: 'https://i.pravatar.cc/150?img=3',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Popular Authors Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Authors',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllAuthorsScreen()),
                      );
                    },
                    child: Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    AuthorCard(
                      name: 'Ferhat Bora',
                      imageUrl: 'https://i.pravatar.cc/150?img=11',
                      followers: '156k',
                      recipes: '1,112',
                    ),
                    AuthorCard(
                      name: 'Yasemin Gürsürer',
                      imageUrl: 'https://i.pravatar.cc/150?img=5',
                      followers: '269k',
                      recipes: '1,159',
                    ),
                    AuthorCard(
                      name: 'Çigdem Esastürk',
                      imageUrl: 'https://i.pravatar.cc/150?img=9',
                      followers: '17k',
                      recipes: '450',
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),

              // Bottom padding for navigation bar
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Color color;
  final String label;
  final String imagePath;

  const _CategoryItem({
    required this.color, 
    required this.label,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.fastfood),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

