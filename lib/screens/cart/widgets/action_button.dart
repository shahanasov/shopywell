import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/checkout/checkout_screen.dart';
import 'package:shopywell/screens/profile_page/profile_create_screen.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // 🛒 Go to cart
        BuyNowButton(
          icon: Icons.shopping_cart_outlined,
          text: 'Go to cart',
          colors: [AppColors.primaryBlue, Colors.blue.shade700],
        ),
        // ⚡ Buy Now
        GestureDetector(
          onTap: () async {
            final userId = FirebaseAuth.instance.currentUser?.uid;

            if (userId == null) return;

            final doc = await FirebaseFirestore.instance
                .collection('users') // 👈 change to your actual collection name
                .doc(userId)
                .get();

            if (doc.exists) {
              // ✅ User profile exists → Go to next screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      CheckoutScreen(), // 👈 or any other screen
                ),
              );
            } else {
              // ❌ User profile does NOT exist → Go to profile creation
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProfileCreateScreen()),
              );
            }
          },
          child: BuyNowButton(
            icon: Icons.touch_app,
            text: 'Buy Now',
            colors: [AppColors.greenDark, AppColors.greenLight],
          ),
        ),
      ],
    );
  }
}

class InfoButtons extends StatelessWidget {
  const InfoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: const [
        InfoButton(icon: Icons.location_on, label: 'Nearest Store'),
        InfoButton(icon: Icons.lock, label: 'VIP'),
        InfoButton(icon: Icons.loop, label: 'Return policy'),
      ],
    );
  }
}

class InfoButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      ),
      onPressed: () {},
      icon: Icon(icon, size: 15),
      label: Text(label, style: const TextStyle(fontSize: 12)),
    );
  }
}

class BuyNowButton extends StatelessWidget {
  IconData icon;
  String text;
  List<Color> colors;
  BuyNowButton({
    super.key,
    required this.icon,
    required this.text,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left circular icon container
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.textSecondary,
                  blurRadius: 8,
                  offset: const Offset(-2, 2),
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.primaryWhite, size: 32),
          ),
          // Text section
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.primaryWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
