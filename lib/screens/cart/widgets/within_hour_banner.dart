import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';

class DeliveryBanner extends StatelessWidget {
  const DeliveryBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.accentPink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Delivery in\n",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: "1 within Hour",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey.shade900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
