
// ui/widgets/product_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/product_detail_provider.dart';

class ProductDetails extends ConsumerWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);

    // final formatCurrency = NumberFormat.simpleCurrency(name: 'INR');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(product.subtitle),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text('${product.rating}', style: const TextStyle(fontWeight: FontWeight.bold)),
            // Text('  ${NumberFormat.decimalPattern().format(product.reviews)}'),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Text(formatCurrency.format(product.oldPrice), style: const TextStyle(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: 10),
            // Text(formatCurrency.format(product.price), style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            const Text('50% Off', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Perhaps the most iconic sneaker of all-time, this original "Chicago" colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time...',
        ),
      ],
    );
  }
}

