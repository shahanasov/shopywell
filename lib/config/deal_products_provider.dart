// Sample data provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/data/models/product_model.dart';

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
          'assets/images/casualwear.jpg',
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
          'assets/images/hrx.png',
      rating: 4.0,
      reviewCount: 344567,
    ),
    Product(
      id: '2',
      name: 'HRX by Hrithik Roshan',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 2499,
      originalPrice: 4999,
      discountPercentage: 50,
      imageUrl:
          'assets/images/hrx.png',
      rating: 4.0,
      reviewCount: 344567,
    ),
  ];
});