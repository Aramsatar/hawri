import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AiRecipeScreen extends StatelessWidget {
  const AiRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Right Pattern
          Positioned(
            top: -50,
            right: -50,
            child: SvgPicture.asset(
              'assets/componets svg vertor/five.svg',
              width: 150,
              height: 150,
            ),
          ),
          
          SafeArea(
            child: Padding(
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
                  Container(
                    width: double.infinity,
                    height: 388, // Updated height
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Color(0xFFFADF86), // #FADF86
                          Color(0xFFFF0033), // #F03
                        ],
                        stops: [0.0962, 0.5005, 1.0], // 9.62%, 50.05%, 100%
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 8.2,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Done? Tap "Design" to continue.',
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  height: 1.1,
                                  letterSpacing: -0.32,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 88,
                              height: 31,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Gemini',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.black,
                                      height: 1.5, // 21px / 14px
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.keyboard_arrow_down, size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Input Area
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.60),
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.71),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  blurRadius: 14,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: const TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Start with a word, and let\'s design something amazing...',
                                
                                
                              ),
                            ),
                          ),
                        ),
                        
                        // Bottom Actions (Black Container)
                        Container(
                          width: double.infinity,
                          height: 65,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(25)),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.71),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 8.2,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.refresh, color: Colors.white),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.description_outlined, color: Colors.white),
                                onPressed: () {},
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.mic_none, color: Colors.white),
                                onPressed: () {},
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Send',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(Icons.send, size: 16, color: Colors.black),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
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
                  Expanded(
                    child: ListView(
                      children: const [
                        _ChatHistoryCard(
                          title: 'Pizza Cooking',
                          calories: '975 kcal',
                          time: '20 min',
                          image: 'https://picsum.photos/id/1084/100/100',
                          color: Color(0xFFEFEBE9), // Light Beige
                        ),
                        SizedBox(height: 16),
                        _ChatHistoryCard(
                          title: 'Meal Cooking',
                          calories: '1200 kcal',
                          time: '35 min',
                          image: 'https://picsum.photos/id/1060/100/100',
                          color: Color(0xFFE0F2F1), // Light Mint
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatHistoryCard extends StatelessWidget {
  final String title;
  final String calories;
  final String time;
  final String image;
  final Color color;

  const _ChatHistoryCard({
    required this.title,
    required this.calories,
    required this.time,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.network(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(calories, style: const TextStyle(fontSize: 12)),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 16),
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
