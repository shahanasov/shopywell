import 'package:flutter/material.dart';
import 'package:shopywell/screens/home/widget/offer_card.dart';

class SponsoredCard extends StatelessWidget {
  const SponsoredCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sponsored Text
            const Text(
              'Sponsored',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
      
            // Horizontal Scrollable Single OfferCard
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [OfferCard(imagePath: 'assets/images/shoeoff.png')],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('up to 50% Off'),
                Icon(Icons.arrow_forward_ios_outlined, size: 15),
              ],
            ),
        ],
      ),
    );
  }
}