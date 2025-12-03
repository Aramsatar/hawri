import 'package:flutter/material.dart';
import '../../widgets/ai_recipe/ai_input_card.dart';
import '../../widgets/ai_recipe/chat_history_card.dart';

class AiRecipeScreen extends StatelessWidget {
  const AiRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Right Pattern
          
          
          SafeArea(
            left: false,
            right: false,
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
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_square, color: Colors.black, size: 20),
                        label: const Text(
                          'New Chat',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Main Gradient Card
                  const AiInputCard(),
                  
                  const SizedBox(height: 32),
                  
                  const Text(
                    'Previews Chats',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Chat History List
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: const [
                      ChatHistoryCard(
                        title: 'Pizza Cooking',
                        calories: '975 kcal',
                        time: '20 min',
                        image: 'https://picsum.photos/id/1084/100/100',
                      ),
                      SizedBox(height: 16),
                      ChatHistoryCard(
                        title: 'Meal Cooking',
                        calories: '1200 kcal',
                        time: '35 min',
                        image: 'https://picsum.photos/id/1060/100/100',
                      ),
                    ],
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
