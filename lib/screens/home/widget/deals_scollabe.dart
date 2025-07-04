import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

// Product Model
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final int discountPercentage;
  final String imageUrl;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discountPercentage,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
  });
}

// Sample data provider
final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: '1',
      name: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 1500,
      originalPrice: 2499,
      discountPercentage: 40,
      imageUrl:
          'https://images.unsplash.com/photo-1583391733956-6c78276477e2?w=300&h=400&fit=crop',
      rating: 4.0,
      reviewCount: 56890,
    ),
    Product(
      id: '2',
      name: 'HRX by Hrithik Roshan',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 2499,
      originalPrice: 4999,
      discountPercentage: 50,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&h=400&fit=crop',
      rating: 4.0,
      reviewCount: 344567,
    ),
  ];
});

// Product Card Widget (DRY principle)
class ProductCard extends ConsumerWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppColors.textSecondary,
        //     spreadRadius: 1,
        //     blurRadius: 0,
        //     offset: const Offset(0, 0),
        //   ),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildProductImage(), _buildProductInfo()],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        image: DecorationImage(
          image: NetworkImage(product.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          _buildPriceSection(),
          const SizedBox(height: 12),
          _buildRatingSection(),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Row(
      children: [
        Text(
          '₹${product.price.toInt()}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        if (product.originalPrice > product.price) ...[
          Text(
            '₹${product.originalPrice.toInt()}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              decoration: TextDecoration.lineThrough,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${product.discountPercentage}%Off',
              style: TextStyle(
                fontSize: 12,
                color: Colors.orange[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRatingSection() {
    return Row(
      children: [
        ...List.generate(5, (index) {
          return Icon(
            index < product.rating.floor()
                ? Icons.star
                : index < product.rating
                ? Icons.star_half
                : Icons.star_border,
            color: Colors.amber,
            size: 16,
          );
        }),
        const SizedBox(width: 8),
        Text(
          _formatNumber(product.reviewCount),
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }
}

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
