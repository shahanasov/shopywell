// models/payment_method_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/config/payment_provider.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/data/repositories/payment_services.dart';
import 'package:shopywell/screens/shipping/widgets/option_tile.dart';

//-----------------------------------------------
// views/checkout_screen.dart
class ShippingScreen extends ConsumerStatefulWidget {
  const ShippingScreen({super.key});

  @override
  ConsumerState<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends ConsumerState<ShippingScreen> {


  @override
  Widget build(BuildContext context) {
    final paymentVM = ref.watch(paymentProvider);

    Map<String, dynamic>? paymentIntent;

    const double order = 7000;
    const double shipping = 30;
    const double total = order + shipping;

  

  // your remaining checkout UI code here...


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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _priceRow("Order", order),
            _priceRow("Shipping", shipping),
            const Divider(),
            _priceRow("Total", total, isBold: true),
            const SizedBox(height: 20),
            const Text(
              "Payment",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...List.generate(
              paymentVM.methods.length,
              (index) => PaymentOptionTile(
                method: paymentVM.methods[index],
                onTap: () => ref.read(paymentProvider).selectMethod(index),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  final amount = calculateAmount(total);
                  // Payment done from here
                  PaymentServices.instance.makePayment(
                    amount,
                    "inr",
                    ref,
                    context,
                  );
                },
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceRow(String label, double amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey.shade600)),
          Text(
            "₹${amount.toStringAsFixed(0)}",
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  int calculateAmount(double amount) {
    final calculatedAmount = (amount * 100).toInt(); // Convert to paise/cents
    return calculatedAmount;
  }
}
