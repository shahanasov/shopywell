import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/bottom_navigation_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class CustomBottomNav extends ConsumerWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  BottomAppBar(
      elevation: 8,
      // shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(ref, icon: Icons.home, label: 'Home', index: 0),
          buildNavItem(
            ref,
            icon: Icons.favorite_border,
            label: 'Wishlist',
            index: 1,
          ),
          SizedBox(width: 5),
          buildNavItem(ref, icon: Icons.search, label: 'Search', index: 3),
          buildNavItem(ref, icon: Icons.settings, label: 'Setting', index: 4),
        ],
      ),
    );
  }

  Widget buildNavItem(
    WidgetRef ref, {
    required IconData icon,
    required String label,
    required int index,
  }) {
    final currentIndex = ref.watch(currentIndexProvider);
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => ref.read(currentIndexProvider.notifier).state = index,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.accentRed : AppColors.textPrimary,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColors.accentRed : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
