






//-----------------------------------------------
// widgets/payment_option_tile.dart

import 'package:flutter/material.dart';
import 'package:shopywell/data/models/payment_model.dart';

class PaymentOptionTile extends StatelessWidget {
  final PaymentMethodModel method;
  final VoidCallback onTap;

  const PaymentOptionTile({super.key, required this.method, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: method.isSelected ? Colors.red : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Image.asset(method.logoPath, width: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(method.maskedNumber),
            ),
          ],
        ),
      ),
    );
  }
}