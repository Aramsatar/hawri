import 'package:flutter/material.dart';

class ChatHistoryCard extends StatelessWidget {
  final String title;
  final String calories;
  final String time;
  final String image;

  const ChatHistoryCard({
    super.key,
    required this.title,
    required this.calories,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 84,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2EDDF),
        borderRadius: BorderRadius.circular(24),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    calories,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, size: 16, color: Colors.black87),
                  const SizedBox(width: 4),
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
