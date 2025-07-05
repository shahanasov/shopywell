import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopywell/config/product_detail_provider.dart';
import 'package:shopywell/screens/wishlist/widget/product_card.dart';

class ProductGridScreen extends ConsumerWidget {
  const ProductGridScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productListProvider);
    final selectedSize = ref.watch(selectedSizeProvider);

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
