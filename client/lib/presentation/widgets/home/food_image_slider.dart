import 'package:flutter/material.dart';

class FoodImageSlider extends StatefulWidget {
  final Axis scrollDirection;

  const FoodImageSlider({
    super.key,
    this.scrollDirection = Axis.horizontal,
  });

  @override
  State<FoodImageSlider> createState() => _FoodImageSliderState();
}

class _FoodImageSliderState extends State<FoodImageSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  final double _viewportFraction = 0.8;
  // Start at a large number to allow scrolling left immediately
  final int _initialPage = 5000;

  // Local assets from assets/images/foods/
  final List<Map<String, String>> _foodItems = [
    {
      'image': 'assets/images/foods/photo_1_2025-12-03_19-44-47.jpg',
      'title': 'Gourmet Steak',
      'time': '45 min',
    },
    {
      'image': 'assets/images/foods/photo_2_2025-12-03_19-44-47.jpg',
      'title': 'Fresh Salad',
      'time': '15 min',
    },
    {
      'image': 'assets/images/foods/photo_3_2025-12-03_19-44-47.jpg',
      'title': 'Berry Smoothie',
      'time': '10 min',
    },
    {
      'image': 'assets/images/foods/photo_4_2025-12-03_19-44-47.jpg',
      'title': 'Pasta Delight',
      'time': '30 min',
    },
    {
      'image': 'assets/images/foods/photo_5_2025-12-03_19-44-47.jpg',
      'title': 'Morning Coffee',
      'time': '5 min',
    },
  ];

  @override
  void initState() {
    super.initState();
    _currentPage = _initialPage;
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: _viewportFraction,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final sliderHeight = (screenHeight * 0.45).clamp(300.0, 500.0);

    return SizedBox(
      height: sliderHeight,
      width: double.infinity,
      child: PageView.builder(
        scrollDirection: widget.scrollDirection,
        controller: _pageController,
        // Large number to simulate infinite scrolling
        itemCount: 10000, 
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        itemBuilder: (context, index) {
          // Use modulo to cycle through items
          final item = _foodItems[index % _foodItems.length];
          
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              } else {
                value = index == _currentPage ? 1.0 : 0.7;
              }

              final curveValue = Curves.easeOut.transform(value);
              return Center(
                child: SizedBox(
                  height: curveValue * sliderHeight,
                  width: curveValue * 350,
                  child: child,
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Stack(
                  children: [
                    // Image
                    Positioned.fill(
                      child: Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                          );
                        },
                      ),
                    ),

                    // Gradient Overlay
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.7),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Top Right Save Icon
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),

                    // Content
                    Positioned(
                      bottom: 24,
                      left: 24,
                      right: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.access_time, color: Colors.white70, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                item['time']!,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              // See Recipe Button
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'See Recipe',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
