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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 330,
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 8.2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _NavBarItem(
                      icon: Icons.home_outlined,
                      isSelected: GoRouterState.of(context).uri.toString() == '/home',
                      onTap: () => context.go('/home'),
                    ),
                    _NavBarItem(
                      icon: Icons.tonality,
                      isSelected: GoRouterState.of(context).uri.toString() == '/learning',
                      onTap: () => context.go('/learning'),
                    ),
                    GestureDetector(
                      onTap: () => context.go('/ai-recipe'),
                      child: Container(
                        width: 55, // Slightly smaller to fit nicely
                        height: 55,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFFC0200), Colors.black], // Red to Black
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
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
                        child: const Icon(Icons.star_outline, color: Colors.white, size: 28),
                      ),
                    ),
                    _NavBarItem(
                      icon: Icons.bar_chart_outlined,
                      isSelected: false, 
                      onTap: () {},
                    ),
                    _NavBarItem(
                      icon: Icons.person_outline,
                      isSelected: false, 
                      onTap: () {},
                    ),
                  ],
                ),
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
          color: Colors.black, // Icons are black
          size: 28,
        ),
      ),
    );
  }
}
