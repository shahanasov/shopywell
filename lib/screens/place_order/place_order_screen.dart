import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/place_order/widgets/cart_item_tile.dart';
import 'package:shopywell/screens/place_order/widgets/price_details_tile.dart';
import 'package:shopywell/screens/shipping/shipping_screen.dart';
import 'package:shopywell/viewmodels/place_order_viewmodel.dart';

class PlaceOrderScreen extends ConsumerWidget {
  const PlaceOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartVM = ref.watch(cartProvider);
    final item = cartVM.items.first;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.textPrimary),
        ),
        backgroundColor: Colors.transparent,
        title: Text('Checkout'),
        centerTitle: true,
        actions: [Icon(Icons.favorite_border)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CartItemTile(item: item),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("\u{1F9F0} Apply Coupons"),
                Text("Select", style: TextStyle(color: Colors.red)),
              ],
            ),
            const Divider(height: 32),
            PriceDetailsTile(
              orderAmount: cartVM.total,
              convenienceFee: 0,
              deliveryFee: 0,
            ),
            const Spacer(),
          ],
        ),
      ),

      bottomSheet: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹${cartVM.total.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    'View Details',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ShippingScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Proceed to Payment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
