import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopywell/screens/home/widget/offer_card.dart';
import 'package:shopywell/viewmodels/offer_viewmodel.dart';

class SummerBanner extends ConsumerWidget {
  const SummerBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banner = ref.watch(bannerProvider);
    final offers = ref.watch(offerProvider).offers;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/images/summersale.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    banner.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    banner.subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: const [
                    Text('View all'),
                    Icon(Icons.arrow_right_alt),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Sponsored Text
          const Text(
            'Sponsored',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Horizontal Scrollable Single OfferCard
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [OfferCard(imagePath: 'assets/images/shoeoff.png')],
              ),
            ),
          ),
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
