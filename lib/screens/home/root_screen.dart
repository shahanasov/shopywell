import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/bottom_navigation_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/core/widgets/custom_bottom_nav.dart';
import 'package:shopywell/screens/cart/cart_screen.dart';
import 'package:shopywell/screens/home/home_screen.dart';
import 'package:shopywell/screens/settings/settings_screen.dart';
import 'package:shopywell/screens/wishlist/wishlist_screen.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentIndexProvider);

    final screens = [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(),
      const SearchScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: screens[index],
      // floatingActionButton:
      //  FloatingActionButton(
        
      //   onPressed: () => ref.read(currentIndexProvider.notifier).state = 2,
      //   backgroundColor: AppColors.primaryWhite,
      //   shape: const CircleBorder(),
      //   elevation: 6,
      //   child: const Icon(Icons.shopping_cart, color: Colors.black),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}


