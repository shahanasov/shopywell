//-----------------------------------------------
// cart_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider((ref) => CartViewModel());

//-----------------------------------------------
// cart_viewmodel.dart


//-----------------------------------------------
// cart_item_model.dart
class CartItemModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String size;
  final int quantity;
  final double price;

  CartItemModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.size,
    required this.quantity,
    required this.price,
  });
}

class CartViewModel extends ChangeNotifier {
  final List<CartItemModel> _items = [
    CartItemModel(
      title: "Women’s Casual Wear",
      subtitle: "Checked Single-Breasted Blazer",
      imageUrl: 'assets/images/casualwear.jpg',
      size: '42',
      quantity: 1,
      price: 7000,
    ),
  ];

  List<CartItemModel> get items => _items;
  double get total => _items.fold(0, (sum, item) => sum + item.price * item.quantity);
  bool get isCouponApplied => false; // Placeholder
}