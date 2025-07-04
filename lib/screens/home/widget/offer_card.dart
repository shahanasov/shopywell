import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String imagePath;
  

  const OfferCard({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width , // overflow 100 pixels
      height: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
