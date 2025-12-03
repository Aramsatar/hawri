import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF2C3E50), // Dark background
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavBarItem(
              iconPath: 'assets/icons/navbar icon/home.svg',
              isSelected: GoRouterState.of(context).uri.toString() == '/home',
              onTap: () => context.go('/home'),
            ),
            _NavBarItem(
              // Using home as placeholder for discovery if needed, or check for discovery icon
              // Wait, ls showed 'home.svg' in navbar icon. I don't see 'discovery.svg'.
              // I'll use 'home.svg' for now or maybe 'search.svg' from appbar icon if appropriate?
              // User said "check the assets folder".
              // I see 'search.svg' in 'appbar icon'.
              // I see 'profile.svg' in 'icons' root? No, 'profile.svg' was in root.
              // Let's use what I saw in ls:
              // assets/icons/navbar icon/home.svg
              // assets/icons/profile.svg
              // assets/icons/settings page icon/notification.svg
              // assets/icons/appbar icon/search.svg
              // I'll use 'search.svg' for Explore/Discovery for now.
              iconPath: 'assets/icons/appbar icon/search.svg', 
              isSelected: GoRouterState.of(context).uri.toString() == '/learning',
              onTap: () => context.go('/learning'),
            ),
            GestureDetector(
              onTap: () => context.go('/ai-recipe'),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
            _NavBarItem(
              iconPath: 'assets/icons/settings page icon/Group 1.svg', // Placeholder for chart/stats
              isSelected: false, 
              onTap: () {},
            ),
            _NavBarItem(
              iconPath: 'assets/icons/profile.svg',
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
  final String iconPath;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.iconPath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : Colors.grey,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
