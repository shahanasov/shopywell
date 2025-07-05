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