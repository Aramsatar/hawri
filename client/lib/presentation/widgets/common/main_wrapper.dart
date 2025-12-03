import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatelessWidget {
  final Widget navigationShell;

  const MainWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 34),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFB0B0B0), // Grey background from image
          borderRadius: BorderRadius.circular(50), // Capsule shape
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavBarItem(
              icon: Icons.home_outlined,
              isSelected: GoRouterState.of(context).uri.toString() == '/home',
              onTap: () => context.go('/home'),
            ),
            _NavBarItem(
              icon: Icons.tonality, // Circle with half filled (matches image)
              isSelected: GoRouterState.of(context).uri.toString() == '/learning',
              onTap: () => context.go('/learning'),
            ),
            GestureDetector(
              onTap: () => context.go('/ai-recipe'),
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF000000), Color(0xFFD32F2F)], // Black to Red
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4D000000),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(Icons.star_outline, color: Colors.white, size: 32), // 4-pointed star look
              ),
            ),
            _NavBarItem(
              icon: Icons.bar_chart_outlined, // Stats
              isSelected: false, 
              onTap: () {},
            ),
            _NavBarItem(
              icon: Icons.person_outline, // Profile
              isSelected: false, 
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: Colors.white, // Icons are white in the image
          size: 28,
        ),
      ),
    );
  }
}
