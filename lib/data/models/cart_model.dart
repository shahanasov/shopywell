import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartItemsProvider = Provider<List<CartItem>>((ref) => [
  CartItem(
    imageUrl: 'assets/images/casualwear.jpg',
    title: "Women's Casual Wear",
    variations: ['Black', 'Red'],
    rating: 4.8,
    price: 34,
    originalPrice: 64,
    discountPercent: 33,
  ),
  CartItem(
    imageUrl: 'assets/images/jacket.png',
    title: "Men's Jacket",
    variations: ['Green', 'Grey'],
    rating: 4.7,
    price: 45,
    originalPrice: 67,
    discountPercent: 28,
  ),
]);


class CartItem {
  final String imageUrl;
  final String title;
  final List<String> variations;
  final double rating;
  final double price;
  final double originalPrice;
  final int discountPercent;

  CartItem({
    required this.imageUrl,
    required this.title,
    required this.variations,
    required this.rating,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
  });
}
