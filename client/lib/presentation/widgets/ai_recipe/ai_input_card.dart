import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AiInputCard extends StatelessWidget {
  const AiInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 388,
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
                  border: InputBorder.none,
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
    );
  }
}
