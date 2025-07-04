import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopywell/screens/wishlist/widget/product_card.dart';
import 'package:shopywell/viewmodels/wishlist_model.dart';

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return WishListGrid(product: products[index]);
        },
      ),
    );
  }
}
