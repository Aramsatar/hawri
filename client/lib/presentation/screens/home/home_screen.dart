import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/home/food_image_slider.dart';
import '../../widgets/home/recipe_card.dart';
import '../../widgets/home/author_card.dart';
import 'all_recipes_screen.dart';
import 'all_authors_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                   CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Test Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'test@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('My Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Support'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out', style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
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
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              const Text(
                'Explore New Recipes',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Outfit',
                ),
              ).animate().fadeIn().slideX(),
              
              const SizedBox(height: 24),
              
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search recipes...',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/icons/appbar icon/search.svg'),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/settings page icon/Group 1.svg', // Using Group 1 as setting/filter placeholder
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
                  const Text(
                    'Popular Recipes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllRecipesScreen()),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Color(0xFFFF2B5E)),
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
                  const Text(
                    'Popular Authors',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AllAuthorsScreen()),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(color: Color(0xFFFF2B5E)),
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

              // Another Item (Dolma)
              Container(
                height: 140,
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dolma\nSpecial',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16),
                            SizedBox(width: 4),
                            Text('45 min'),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
              ),
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
