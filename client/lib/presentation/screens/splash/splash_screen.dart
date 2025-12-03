import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        context.go('/welcome');
      }
    });
  }

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
          
          // Bottom Left Pattern
          Positioned(
            bottom: 100,
            left: -65,
            child: SvgPicture.asset(
              'assets/componets svg vertor/forth.svg',
              width: 131,
              height: 131,
            
            ),
          ),
          
          // Top Right Pattern (Rotated)
          Positioned(
            top: 100,
            right: -65,
            child: Transform.rotate(
              angle: 0, // 180 degrees
              child: SvgPicture.asset(
                'assets/componets svg vertor/forth.svg',
                width: 131,
                height: 131,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
