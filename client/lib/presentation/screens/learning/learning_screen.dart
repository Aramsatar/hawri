import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

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
                    'Learning',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Outfit',
                    ),
                  ),
                  Icon(Icons.grid_view, color: Theme.of(context).primaryColor),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Categories
              Row(
                children: [
                  _CategoryChip(label: 'Nutrition', isSelected: true),
                  const SizedBox(width: 12),
                  _CategoryChip(label: 'Fitness', isSelected: false),
                  const SizedBox(width: 12),
                  _CategoryChip(label: 'Winter', isSelected: false),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Stacked Cards
              SizedBox(
                height: 500,
                child: Stack(
                  children: [
                    // Bottom Card (Green)
                    Positioned(
                      top: 160,
                      left: 0,
                      right: 0,
                      child: _LearningCard(
                        color: const Color(0xFFB2DFDB), // Light Green
                        title: 'Tricks for clirus',
                        subtitle: 'EKILU, THE recipe\nfor a balance food',
                        height: 320,
                        showVideo: true,
                      ),
                    ).animate().slideY(begin: 0.2, delay: 200.ms),
                    
                    // Middle Card (Blue)
                    Positioned(
                      top: 80,
                      left: 0,
                      right: 0,
                      child: _LearningCard(
                        color: const Color(0xFFC5CAE9), // Light Blue
                        title: 'Nutrition Without\nObsession',
                        height: 320,
                        showVideo: false,
                      ),
                    ).animate().slideY(begin: 0.2, delay: 100.ms),
                    
                    // Top Card (Purple)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: _LearningCard(
                        color: const Color(0xFFE1BEE7), // Light Purple
                        title: 'Agean\nBreeze Salad',
                        height: 320,
                        showVideo: false,
                      ),
                    ).animate().slideY(begin: 0.2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _CategoryChip({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey[100] : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

class _LearningCard extends StatelessWidget {
  final Color color;
  final String title;
  final String? subtitle;
  final double height;
  final bool showVideo;

  const _LearningCard({
    required this.color,
    required this.title,
    this.subtitle,
    required this.height,
    required this.showVideo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 16),
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.access_time, size: 16),
                SizedBox(width: 4),
                Text('20 min'),
              ],
            ),
          ],
          if (showVideo) ...[
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'See the video',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_arrow, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
