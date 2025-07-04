import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = Provider<List<CategoryModel>>((ref) {
  return [
    CategoryModel(name: "Beauty", image: "assets/images/beauty.jpg"),
    CategoryModel(name: "Fashion", image: "assets/images/fashion.jpg"),
    CategoryModel(name: "Kids", image: "assets/images/kids.jpg"),
    CategoryModel(name: "Mens", image: "assets/images/men.jpg"),
    CategoryModel(name: "Womens", image: "assets/images/women.jpg"),
  ];
});


class CategoryModel {
  final String name;
  final String image;

  CategoryModel({required this.name, required this.image});
}
