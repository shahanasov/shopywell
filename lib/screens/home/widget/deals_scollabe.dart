import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/deal_products_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/data/models/product_model.dart';
import 'package:shopywell/screens/home/widget/product_card.dart';

// Main Product Listing Page
class ProductListingPage extends ConsumerWidget {
  const ProductListingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Container(
      height: 450,
      color: AppColors.softWhite,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(child: buildProductList(products)),
          ],
        ),
      ),
    );
  }

  Widget buildProductList(List<Product> products) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
          Positioned(right: 20, bottom: 180, child: _buildNavigationButton()),
        ],
      ),
    );
  }

  Widget _buildNavigationButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.textSecondary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textSecondary,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
