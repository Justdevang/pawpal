// ignore_for_file: type=lint
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

/// Main scaffold with bottom navigation for authenticated users
class MainScaffold extends ConsumerWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = GoRouter.of(context);
    final location = router.routeInformationProvider.value.uri.toString();

    int currentIndex = 0;
    if (location.startsWith('/pets')) currentIndex = 1;
    else if (location.startsWith('/services')) currentIndex = 2;
    else if (location.startsWith('/settings') || location.startsWith('/family')) currentIndex = 3;

    final bool hideBottomNav = location.contains('/add') ||
        location.contains('/edit') ||
        RegExp(r'/pets/\d+').hasMatch(location) ||
        location.startsWith('/reminders/') ||
        location.startsWith('/settings/') ||
        (location != '/services' && location.startsWith('/services/')) ||
        RegExp(r'/vaccinations/\d+').hasMatch(location) ||
        RegExp(r'/medications/\d+').hasMatch(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: hideBottomNav
          ? null
          : PawlyBottomNav(
              currentIndex: currentIndex,
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go('/');
                    break;
                  case 1:
                    context.go('/pets');
                    break;
                  case 2:
                    context.go('/services');
                    break;
                  case 3:
                    context.go('/settings');
                    break;
                }
              },
            ),
    );
  }
}

/// Bottom navigation per Pawly spec: floating pill bar, maroon, 4 items, orange active
class PawlyBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PawlyBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<PawPalColors>()!;

    return Container(
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: colors.overlay.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                index: 0,
                currentIndex: currentIndex,
              icon: Icons.home_rounded,
              activeIcon: Icons.home_rounded,
              label: 'Home',
              colors: colors,
              onTap: onTap,
            ),
            _NavItem(
              index: 1,
              currentIndex: currentIndex,
              icon: Icons.pets_rounded,
              activeIcon: Icons.pets_rounded,
              label: 'Health',
              colors: colors,
              onTap: onTap,
            ),
            _NavItem(
              index: 2,
              currentIndex: currentIndex,
              icon: Icons.medical_services_rounded,
              activeIcon: Icons.medical_services_rounded,
              label: 'Services',
              colors: colors,
              onTap: onTap,
            ),
            _NavItem(
              index: 3,
              currentIndex: currentIndex,
              icon: Icons.person_rounded,
              activeIcon: Icons.person_rounded,
              label: 'Profile',
              colors: colors,
              onTap: onTap,
            ),
          ],
        ),
      ),
    ),
  );
}
}

class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final PawPalColors colors;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.colors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = index == currentIndex;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isActive ? activeIcon : icon,
                color: isActive ? colors.accent : colors.onPrimary.withValues(alpha: 0.6),
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive ? colors.accent : colors.onPrimary.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}