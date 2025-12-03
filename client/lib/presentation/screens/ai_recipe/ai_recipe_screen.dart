import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AiRecipeScreen extends StatelessWidget {
  const AiRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'AI Recipe',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Outfit',
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.edit_square, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        'New Chat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Main AI Card
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFF8E1), // Light yellow
                      Color(0xFFFFCDD2), // Light red
                      Color(0xFFF44336), // Red
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 200,
                            child: Text(
                              'Done? Tap "Design"\nto continue.',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                Text('Gemini', style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(width: 4),
                                Icon(Icons.keyboard_arrow_down, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 24),
                      
                      // Input Area
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.6),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Start with a word, and let\'s design something amazing...',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(Icons.edit, color: Colors.red, size: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Bottom Controls
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.refresh, color: Colors.white),
                              style: IconButton.styleFrom(backgroundColor: Colors.white.withValues(alpha: 0.2)),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.description, color: Colors.white),
                              style: IconButton.styleFrom(backgroundColor: Colors.white.withValues(alpha: 0.2)),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.mic, color: Colors.white),
                              style: IconButton.styleFrom(backgroundColor: Colors.white.withValues(alpha: 0.2)),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Row(
                                children: [
                                  Text('Send', style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(width: 4),
                                  Icon(Icons.send, size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn().scale(),
              
              const SizedBox(height: 32),
              
              const Text(
                'Previews Chats',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              const SizedBox(height: 16),
              
              _PreviewChatItem(
                title: 'Pizza Cooking',
                calories: '975 kcal',
                time: '20 min',
                imageColor: Colors.orange,
              ),
              
              const SizedBox(height: 16),
              
              _PreviewChatItem(
                title: 'Meal Cooking',
                calories: '1200 kcal',
                time: '35 min',
                imageColor: Colors.brown,
              ),
              
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewChatItem extends StatelessWidget {
  final String title;
  final String calories;
  final String time;
  final Color imageColor;

  const _PreviewChatItem({
    required this.title,
    required this.calories,
    required this.time,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: imageColor.withValues(alpha: 0.2),
            child: Icon(Icons.fastfood, color: imageColor),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.local_fire_department, size: 14, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(calories, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 12),
                  const Icon(Icons.access_time, size: 14),
                  const SizedBox(width: 4),
                  Text(time, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
