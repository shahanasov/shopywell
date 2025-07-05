
import 'package:flutter/material.dart';
import 'package:shopywell/viewmodels/place_order_viewmodel.dart';

class CartItemTile extends StatelessWidget {
  final CartItemModel item;
  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(item.imageUrl, width: 100, height: 100, fit: BoxFit.cover),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(item.subtitle),
              Row(
                children: [
                  Text('Size: ${item.size}'),
                  const SizedBox(width: 10),
                  Text('Qty: ${item.quantity}'),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Delivery by 10 May 2XXX',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
