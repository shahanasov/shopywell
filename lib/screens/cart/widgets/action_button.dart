import 'package:flutter/material.dart';
import 'package:shopywell/core/constants/colors/app_colors.dart';
import 'package:shopywell/screens/checkout/checkout_screen.dart';

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
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CheckoutScreen()));
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
      width: 170,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
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
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(-2, 2),
                ),
              ],
            ),
            child:  Icon(icon, color: Colors.white, size: 32),
          ),
          // Text section
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
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
