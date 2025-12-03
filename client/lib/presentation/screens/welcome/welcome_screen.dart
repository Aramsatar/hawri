import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Center Text
          Center(
            child: Text(
              'هەوری',
              style: TextStyle(
                fontFamily: 'UniMahanNurhan',
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          
          // Top Left Pattern (Black) - Assuming second.svg
          Positioned(
            top: -150,
            left: -120,
            child: SvgPicture.asset(
              'assets/componets svg vertor/five.svg',
              width: 303,
              height: 306,
              
            ),
          ),
          
          // Top Right Pattern (Red, Rotated) - first.svg
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

          // Bottom Left Pattern (Red) - first.svg
          Positioned(
            bottom: 100,
            left: -65,
            child: SvgPicture.asset(
              'assets/componets svg vertor/forth.svg',
              width: 131,
              height: 131,
            
            ),
          ),

          // Bottom Right Pattern (Red, Rotated) - first.svg
          

          // Next Button
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go('/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD32F2F), // Deep Red
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
