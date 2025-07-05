//-----------------------------------------------
// price_details_tile.dart
// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PriceDetailsTile extends StatelessWidget {
  final double orderAmount;
  final double convenienceFee;
  final double deliveryFee;

  const PriceDetailsTile({
    super.key,
    required this.orderAmount,
    required this.convenienceFee,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Order Payment Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildRow("Order Amount", "₹${orderAmount.toStringAsFixed(2)}"),
        _buildRow("Convenience", "Know More", highlight: true),
        _buildRow(
          "Delivery Fee",
          deliveryFee == 0 ? 'Free' : '₹${deliveryFee.toStringAsFixed(2)}',
        ),
        const Divider(),
        _buildRow(
          "Order Total",
          "₹${(orderAmount + convenienceFee + deliveryFee).toStringAsFixed(2)}",
          isBold: true,
        ),
      ],
    );
  }

  Widget _buildRow(
    String title,
    String value, {
    bool highlight = false,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: highlight ? Colors.red : null)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}